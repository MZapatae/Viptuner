//
//  AlamofireNetworkProvider.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/11/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

//import Alamofire
//import RxAlamofire
//import RxSwift
//
//final class AlamofireNetworkProvider<ResponseModel, ReactiveResponse>: NetworkProviderProtocol {
//    private let sessionManager: Alamofire.SessionManager
//
//    init() {
//        let sessionConfiguration = URLSessionConfiguration.default
//        sessionConfiguration.timeoutIntervalForRequest = 20
//        self.sessionManager = Alamofire.SessionManager(configuration: sessionConfiguration)
//    }
//
//    func request<Endpoint>(_ endpoint: Endpoint) -> ReactiveResponse where Endpoint: EndpointProviderProtocol, AlamofireNetworkProvider.ResponseModel == Endpoint.ResponseModel {
//
//        let request = sessionManager.request(url(path: endpoint.path),
//                                             method: httpMethod(from: endpoint.method),
//                                             parameters: endpoint.parameters)
//
//
//
//
//
//
//    }
//
//
//
//    private func url(path: Path) -> URL {
//        return URL(string: path)!
//    }
//
//    private func httpMethod(from method: HttpMethod) -> Alamofire.HTTPMethod {
//        switch method {
//        case .get: return .get
//        case .post: return .post
//        case .put: return .put
//        case .patch: return .patch
//        case .delete: return .delete
//        }
//    }
//
//}
