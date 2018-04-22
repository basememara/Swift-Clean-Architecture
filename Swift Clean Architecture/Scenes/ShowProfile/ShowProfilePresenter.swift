//
//  ShowProfilePresenter.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit
import CompanyCore

struct ShowProfilePresenter: ShowProfilePresentable {
    private weak var viewController: ShowProfileDisplayable?
    
    init(viewController: ShowProfileDisplayable?) {
        self.viewController = viewController
    }
}

extension ShowProfilePresenter {
    
    func presentFetchedUser(for response: ShowProfileModels.Response) {
        let viewModel = ShowProfileModels.ViewModel(
            id: response.user.id,
            name: "\(response.user.firstName) \(response.user.lastName)",
            email: response.user.email
        )
        
        viewController?.displayFetchedUser(with: viewModel)
    }
    
    func presentFetchedUser(error: DataError) {
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: "Profile Error", // TODO: Localize
            message: "There was an error retrieving the profile: \(error)" // TODO: Localize
        )
        
        viewController?.display(error: viewModel)
    }
}
