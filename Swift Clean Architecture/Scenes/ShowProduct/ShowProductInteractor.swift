//
//  ShowProductInteractor.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import CompanyCore

struct ShowProductInteractor {
    private let presenter: ShowProductPresentable
    private let productsWorker: ProductsWorkerType
    
    init(presenter: ShowProductPresentable, productsWorker: ProductsWorkerType) {
        self.presenter = presenter
        self.productsWorker = productsWorker
    }
}

extension ShowProductInteractor: ShowProductBusinessLogic {
    
    func fetchProduct(with request: ShowProductModels.FetchRequest) {
        productsWorker.fetch(id: request.id) {
            guard let value = $0.value, $0.isSuccess else {
                return self.presenter.presentFetchedProduct(error: $0.error ?? .unknownReason(nil))
            }
            
            self.presenter.presentFetchedProduct(
                for: ShowProductModels.Response(product: value)
            )
        }
    }
}
