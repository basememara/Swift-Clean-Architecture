//
//  ListProductsInteractor.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import CompanyCore

struct ListProductsInteractor {
    private let presenter: ListProductsPresentable
    private let productsWorker: ProductsWorkerType
    
    init(presenter: ListProductsPresentable, productsWorker: ProductsWorkerType) {
        self.presenter = presenter
        self.productsWorker = productsWorker
    }
}

extension ListProductsInteractor: ListProductsBusinessLogic {
    
    func fetchProducts(with request: ListProductsModels.FetchRequest) {
        productsWorker.fetch {
            guard let value = $0.value, $0.isSuccess else {
                return self.presenter.presentFetchedProducts(error: $0.error ?? .unknownReason(nil))
            }
            
            self.presenter.presentFetchedProducts(
                for: ListProductsModels.Response(products: value)
            )
        }
    }
    
    func searchProducts(with request: ListProductsModels.SearchRequest) {
        let workerRequest = ProductsModels.SearchRequest(query: request.text)
        
        productsWorker.search(with: workerRequest) {
            guard let value = $0.value, $0.isSuccess else {
                return self.presenter.presentSearchedProducts(error: $0.error ?? .unknownReason(nil))
            }
            
            self.presenter.presentSearchedProducts(
                for: ListProductsModels.Response(products: value)
            )
        }
    }
}
