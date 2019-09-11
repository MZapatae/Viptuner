//
//  NetworkProviderContract.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/10/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]
typealias Path = String

enum HttpMethod {
    case get, post, put, patch, delete
}

protocol NetworkProviderProtocol {
    associatedtype ResponseModel
    associatedtype ReactiveResponse
    func request<Endpoint: EndpointProviderProtocol>(_ endpoint: Endpoint) -> ReactiveResponse where Endpoint.ResponseModel == ResponseModel
}

protocol EndpointProviderProtocol: class {
    associatedtype ResponseModel
    
    var method: HttpMethod { get }
    var path: Path { get }
    var parameters: Parameters? { get }
    var decode: (Data) -> ResponseModel? { get }
    
    init(method: HttpMethod, path: Path, parameters: Parameters?, decode: @escaping (Data) -> ResponseModel?)
}

extension EndpointProviderProtocol where ResponseModel: Codable {
    init(method: HttpMethod, path: Path, parameters: Parameters? = nil) {
        self.init(method: method, path: path, parameters: parameters, decode: {
            return try? JSONDecoder().decode(ResponseModel.self, from: $0)
        })
    }
}

extension EndpointProviderProtocol where ResponseModel == Void {
    init(method: HttpMethod, path: Path, parameters: Parameters? = nil) {
        self.init(method: method, path: path, parameters: parameters, decode: { _ in () })
    }
}
