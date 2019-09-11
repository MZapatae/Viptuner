//
//  EndpointProvider.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/11/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import Foundation

final class Endpoint<ResponseModel>: EndpointProviderProtocol {
    let method: HttpMethod
    let path: Path
    let parameters: Parameters?
    let decode: (Data) -> ResponseModel?
    
    init(method: HttpMethod, path: Path, parameters: Parameters? = nil, decode: @escaping (Data) -> ResponseModel?) {
        self.method = method
        self.path = path
        self.parameters = parameters
        self.decode = decode
    }
}
