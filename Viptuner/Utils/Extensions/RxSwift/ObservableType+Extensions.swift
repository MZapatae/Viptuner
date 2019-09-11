//
//  ObservableType+Extensions.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/11/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

import RxSwift

extension ObservableType {
    
    public func mapDataAsObject<T: Codable>(type: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            guard let (response, object) = data as? (HTTPURLResponse, Data) else {
                throw NetworkError
            }
            
            
            
            
        }
    }
    
    
    
}
