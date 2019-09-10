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
    associatedtype ResponseEntity
    associatedtype ReactiveResponse
    func request<Endpoint: EndpointProviderProtocol>(_ endpoint: Endpoint) -> ReactiveResponse where Endpoint.ResponseEntity == ResponseEntity
}

protocol EndpointProviderProtocol: class {
    associatedtype ResponseEntity
    
    var method: HttpMethod { get }
    var path: Path { get }
    var parameters: Parameters? { get }
    var decode: (Data) -> ResponseEntity? { get }
    
    init(method: HttpMethod, path: Path, parameters: Parameters?, decode: (Data) -> ResponseEntity?)
}

extension EndpointProviderProtocol where ResponseEntity: Codable {
    init(method: HttpMethod, path: Path, parameters: Parameters? = nil) {
        self.init(method: method, path: path, parameters: parameters, decode: {
            return try? JSONDecoder().decode(ResponseEntity.self, from: $0)
        })
    }
}

extension EndpointProviderProtocol where ResponseEntity == Void {
    init(method: HttpMethod, path: Path, parameters: Parameters? = nil) {
        self.init(method: method, path: path, parameters: parameters, decode: { _ in () })
    }
}
