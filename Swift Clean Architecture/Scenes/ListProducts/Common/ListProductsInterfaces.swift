//
//  ListProductsInterfaces.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import CompanyCore

protocol ListProductsDisplayable: class, AppDisplayable { // View Controlelr
    func displayFetchedProducts(with viewModel: ListProductsModels.ViewModel)
    func displaySearchedProducts(with viewModel: ListProductsModels.ViewModel)
}

protocol ListProductsBusinessLogic { // Interactor
    func fetchProducts(with request: ListProductsModels.FetchRequest)
    func searchProducts(with request: ListProductsModels.SearchRequest)
}

protocol ListProductsPresentable { // Presenter
    func presentFetchedProducts(for response: ListProductsModels.Response)
    func presentFetchedProducts(error: DataError)
    
    func presentSearchedProducts(for response: ListProductsModels.Response)
    func presentSearchedProducts(error: DataError)
}

protocol ListProductsRoutable: AppRoutable { // Router
    func showProduct(for id: Int)
    func showBookmark()
}
