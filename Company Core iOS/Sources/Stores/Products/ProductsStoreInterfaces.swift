//
//  ProductsStoreInterfaces.swift
//
//  Company Core iOS
//
//  Created by Basem Emara on 2018-04-19.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

public protocol ProductsStore {
    func fetch(completion: @escaping (Result<[ProductType], DataError>) -> Void)
    func fetch(id: Int, completion: @escaping (Result<ProductType, DataError>) -> Void)
    
    func search(with request: ProductsModels.SearchRequest, completion: @escaping (Result<[ProductType], DataError>) -> Void)
}

public protocol ProductsWorkerType: ProductsStore {

}
