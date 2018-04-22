//
//  ListProductsPresenter.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit
import CompanyCore

struct ListProductsPresenter: ListProductsPresentable {
    private weak var viewController: ListProductsDisplayable?
    private let currencyFormatter: NumberFormatter
    
    init(viewController: ListProductsDisplayable?) {
        self.viewController = viewController
        
        self.currencyFormatter = NumberFormatter()
        self.currencyFormatter.numberStyle = .currency
    }
}

extension ListProductsPresenter {
    
    func presentFetchedProducts(for response: ListProductsModels.Response) {
        let viewModel = ListProductsModels.ViewModel(
            products: response.products.map { make(product: $0) }
        )
        
        viewController?.displayFetchedProducts(with: viewModel)
    }
    
    func presentFetchedProducts(error: DataError) {
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: "Products Error", // TODO: Localize
            message: "There was an error retrieving the products: \(error)" // TODO: Localize
        )
        
        viewController?.display(error: viewModel)
    }
}

extension ListProductsPresenter {
    
    func presentSearchedProducts(for response: ListProductsModels.Response) {
        let viewModel = ListProductsModels.ViewModel(
            products: response.products.map { make(product: $0) }
        )
        
        viewController?.displayFetchedProducts(with: viewModel)
    }
    
    func presentSearchedProducts(error: DataError) {
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: "Search Error", // TODO: Localize
            message: "There was an error searching for products: \(error)" // TODO: Localize
        )
        
        viewController?.display(error: viewModel)
    }
}

// MARK: - Helpers

private extension ListProductsPresenter {

    func make(product: ProductType) -> ListProductsModels.ProductViewModel {
        return ListProductsModels.ProductViewModel(
            id: product.id,
            name: product.name,
            content: product.content,
            price: currencyFormatter.string(from: NSNumber(value: Float(product.priceCents) / 100))
                ?? "\(product.priceCents / 100)"
        )
    }
}
