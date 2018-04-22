//
//  ShowProfileInterfaces.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import CompanyCore

protocol ShowProfileDisplayable: class, AppDisplayable {
    func displayFetchedUser(with viewModel: ShowProfileModels.ViewModel)
}

protocol ShowProfileBusinessLogic {
    func fetchUser(with request: ShowProfileModels.FetchRequest)
}

protocol ShowProfilePresentable {
    func presentFetchedUser(for response: ShowProfileModels.Response)
    func presentFetchedUser(error: DataError)
}

protocol ShowProfileRoutable: AppRoutable {
    
}
