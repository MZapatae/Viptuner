//
//  ObservableType+Extensions.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/11/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import RxSwift

extension ObservableType {
    
    public func mapResponseDataAsObject<T: Codable>(type: T.Type) -> Observable<T> {
        return flatMap { responseData -> Observable<T> in
            guard let (response, data) = responseData as? (HTTPURLResponse, Data) else {
                throw NetworkError.dataCantDecode
            }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                return Observable.just(object)
            }
        }
    }
    
    public func mapResponseDataAsArray<T: Codable>(type: T.Type) -> Observable<T> {
        return flatMap { responseData -> Observable<T> in
            guard let (response, data) = responseData as? (HTTPURLResponse, Data) else {
                throw NetworkError.dataCantDecode
            }
            
            do {
                let object = try JSONDecoder().decode([T].self, from: data)
                return Observable.from(object)
            }
        }
    }
}
