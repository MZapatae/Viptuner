//
//  NetworkProvider.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/10/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import Foundation

// TODO: Improve later with headers in protocol

typealias Parameters = [String: Any]
typealias Path = String

enum HttpMethod {
    case get, post, put, patch, delete
}

protocol NetworkProvider {
    associatedtype ResponseData
    func request<Endpoint: EndpointProvider>(_ endpoint: Endpoint) -> ResponseData
}

protocol EndpointProvider: class {
    associatedtype ResponseModel
    
    var method: HttpMethod { get }
    var path: Path { get }
    var parameters: Parameters? { get }
    var decode: (Data) -> ResponseModel? { get }
    
    init(method: HttpMethod, path: Path, parameters: Parameters?, decode: @escaping (Data) -> ResponseModel?)
}

extension EndpointProvider where ResponseModel: Codable {
    init(method: HttpMethod, path: Path, parameters: Parameters? = nil) {
        self.init(method: method, path: path, parameters: parameters, decode: {
            return try? JSONDecoder().decode(ResponseModel.self, from: $0)
        })
    }
}

extension EndpointProvider where ResponseModel == Void {
    init(method: HttpMethod, path: Path, parameters: Parameters? = nil) {
        self.init(method: method, path: path, parameters: parameters, decode: { _ in () })
    }
}

enum NetworkError: Error {
    case internalServer
    case dataCantDecode
}
