//
//  AlamofireNetworkProvider.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/11/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import Alamofire
import RxAlamofire
import RxSwift

final class RxAlamofireNetworkProvider: NetworkProvider {
    typealias ResponseData = Observable<(HTTPURLResponse, Data)>
    
    static let shared = RxAlamofireNetworkProvider()
    private let sessionManager: Alamofire.SessionManager

    private init() {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = 30
        self.sessionManager = Alamofire.SessionManager(configuration: sessionConfiguration)
    }
    
    func request<Endpoint>(_ endpoint: Endpoint) -> ResponseData where Endpoint : EndpointProvider {
        let request = sessionManager.request(
            url(path: endpoint.path),
            method: self.httpMethod(from: endpoint.method),
            parameters: endpoint.parameters)
        
        return request.validate().rx.responseData()
    }
    
    
    private func url(path: Path) -> URL {
        return URL(string: path)!
    }
    
    private func httpMethod(from method: HttpMethod) -> Alamofire.HTTPMethod {
        switch method {
        case .get: return .get
        case .post: return .post
        case .put: return .put
        case .patch: return .patch
        case .delete: return .delete
        }
    }

}
