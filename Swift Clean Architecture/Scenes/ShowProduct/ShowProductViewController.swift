//
//  ShowProductViewController.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit
import CompanyCore

class ShowProductViewController: UIViewController {
    
    // MARK: - Controls
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - VIP variables
    
    private lazy var interactor: ShowProductBusinessLogic = ShowProductInteractor(
        presenter: ShowProductPresenter(viewController: self),
        productsWorker: ProductsWorker(store: ProductsMemoryStore())
    )
    
    private lazy var router: ShowProductRoutable = ShowProductRouter(
        viewController: self
    )
    
    // MARK: - Internal variables
    
    var productID: Int! // Must assign or die
    var routerParams: (name: String, content: String, price: String)? // Pre-fetched data
    
    // MARK: - Controller cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        loadData()
    }
}

// MARK: - Events

private extension ShowProductViewController {
    
    func configure() {
        // Bind pre-fetched data if available, still fetch via loadData()
        // later in case scene deep linked or data changed on server
        guard let params = routerParams else { return }
        navigationItem.title = params.name
        contentLabel.text = params.content
        priceLabel.text = params.price
        
        // Wipe router params to avoid reuse
        routerParams = nil
    }
        
    func loadData() {
        interactor.fetchProduct(
            with: ShowProductModels.FetchRequest(
                id: productID
            )
        )
    }
}

// MARK: - VIP cycle

extension ShowProductViewController: ShowProductDisplayable {

    func displayFetchedProduct(with viewModel: ShowProductModels.ViewModel) {
        navigationItem.title = viewModel.name
        contentLabel.text = viewModel.content
        priceLabel.text = viewModel.price
    }
}

// MARK: - Taps

private extension ShowProductViewController {
    
    @IBAction func close(_ sender: Any) {
        router.dismiss()
    }
}
