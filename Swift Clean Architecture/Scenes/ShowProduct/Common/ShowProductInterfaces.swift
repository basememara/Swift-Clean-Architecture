//
//  ShowProductInterfaces.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import CompanyCore

protocol ShowProductDisplayable: class, AppDisplayable {
    func displayFetchedProduct(with viewModel: ShowProductModels.ViewModel)
}

protocol ShowProductBusinessLogic {
    func fetchProduct(with request: ShowProductModels.FetchRequest)
}

protocol ShowProductPresentable {
    func presentFetchedProduct(for response: ShowProductModels.Response)
    func presentFetchedProduct(error: DataError)
}

protocol ShowProductRoutable: AppRoutable {
    
}
