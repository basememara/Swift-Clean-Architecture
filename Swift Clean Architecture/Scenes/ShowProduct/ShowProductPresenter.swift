//
//  ShowProductPresenter.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit
import CompanyCore

struct ShowProductPresenter: ShowProductPresentable {
    private weak var viewController: ShowProductDisplayable?
    private let currencyFormatter: NumberFormatter
    
    init(viewController: ShowProductDisplayable?) {
        self.viewController = viewController
        
        self.currencyFormatter = NumberFormatter()
        self.currencyFormatter.numberStyle = .currency
    }
}

extension ShowProductPresenter {
    
    func presentFetchedProduct(for response: ShowProductModels.Response) {
        let viewModel = ShowProductModels.ViewModel(
            id: response.product.id,
            name: response.product.name,
            content: response.product.content,
            price: currencyFormatter.string(from: NSNumber(value: Float(response.product.priceCents) / 100))
                ?? "\(response.product.priceCents / 100)"
        )
        
        viewController?.displayFetchedProduct(with: viewModel)
    }
    
    func presentFetchedProduct(error: DataError) {
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: "Product Error", // TODO: Localize
            message: "There was an error retrieving the product: \(error)" // TODO: Localize
        )
        
        viewController?.display(error: viewModel)
    }
}
