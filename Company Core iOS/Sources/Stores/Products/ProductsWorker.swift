//
//  ProductsWorker.swift
//  Company Core iOS
//
//  See link for proper dependency injectection technique:
//  http://basememara.com/swift-protocol-oriented-dependency-injection/
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

public struct ProductsWorker: ProductsWorkerType {
    private let store: ProductsStore
    
    public init(store: ProductsStore) {
        self.store = store
    }
}

public extension ProductsWorker {
    
    func fetch(completion: @escaping (Result<[ProductType], DataError>) -> Void) {
        store.fetch(completion: completion)
    }
    
    func fetch(id: Int, completion: @escaping (Result<ProductType, DataError>) -> Void) {
        store.fetch(id: id, completion: completion)
    }
    
    func search(with request: ProductsModels.SearchRequest, completion: @escaping (Result<[ProductType], DataError>) -> Void) {
        store.search(with: request, completion: completion)
    }
}
