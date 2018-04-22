//
//  ShowProfile.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit
import CompanyCore

class ShowProfileViewController: UIViewController {
    
    // MARK: - Controls
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: - VIP variables
    
    private lazy var interactor: ShowProfileBusinessLogic = ShowProfileInteractor(
        presenter: ShowProfilePresenter(viewController: self),
        usersWorker: UsersWorker(store: UsersMemoryStore())
    )
    
    private lazy var router: ShowProfileRoutable = ShowProfileRouter(
        viewController: self
    )
    
    // MARK: - Controller cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
}

// MARK: - Events

private extension ShowProfileViewController {
    
    func loadData() {
        interactor.fetchUser(
            with: ShowProfileModels.FetchRequest()
        )
    }
}

// MARK: - VIP cycle

extension ShowProfileViewController: ShowProfileDisplayable {
    
    func displayFetchedUser(with viewModel: ShowProfileModels.ViewModel) {
        idLabel.text = "\(viewModel.id)"
        nameLabel.text = viewModel.name
        emailLabel.text = viewModel.email
    }
}
