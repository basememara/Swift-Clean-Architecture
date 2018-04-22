//
//  ListProductsViewController.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit
import CompanyCore

class ListProductsViewController: UIViewController {
    
    // MARK: - Controls
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(
                UINib(nibName: String(describing: ListProductsTableViewCell.self), bundle: nil),
                forCellReuseIdentifier: cellReuseIdentifier
            )
        }
    }
    
    private lazy var searchController: UISearchController = {
        $0.searchResultsUpdater = self
        $0.hidesNavigationBarDuringPresentation = false
        $0.dimsBackgroundDuringPresentation = false
        $0.searchBar.placeholder = "Search products..."
        return $0
    }(UISearchController(searchResultsController: nil))
    
    // MARK: - VIP variables
    
    private lazy var interactor: ListProductsBusinessLogic = ListProductsInteractor(
        presenter: ListProductsPresenter(viewController: self),
        productsWorker: ProductsWorker(store: ProductsMemoryStore())
    )
    
    private lazy var router: ListProductsRoutable = ListProductsRouter(
        viewController: self
    )
    
    // MARK: - View models
    
    private var viewModel: ListProductsModels.ViewModel?
    
    // MARK: - Internal variables
    
    private let cellReuseIdentifier = "Cell"
    
    // MARK: - Controller cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        loadData()
    }
}

// MARK: - Events

private extension ListProductsViewController {
    
    func configure() {
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    func loadData() {
        interactor.fetchProducts(
            with: ListProductsModels.FetchRequest()
        )
    }
    
    func searchData(for text: String) {
        interactor.searchProducts(
            with: ListProductsModels.SearchRequest(text: text)
        )
    }
    
    func loadUI() {
        tableView.reloadData()
    }
}

// MARK: - VIP cycle

extension ListProductsViewController: ListProductsDisplayable {
    
    func displayFetchedProducts(with viewModel: ListProductsModels.ViewModel) {
        self.viewModel = viewModel
        loadUI()
    }
    
    func displaySearchedProducts(with viewModel: ListProductsModels.ViewModel) {
        self.viewModel = viewModel
        loadUI()
    }
}

// MARK: - Taps

extension ListProductsViewController {

    @IBAction func openBookmark(_ sender: Any) {
        router.showBookmark()
    }
}

// MARK: - Delegates

extension ListProductsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel?.products[indexPath.row] else { return }
        router.showProduct(for: model.id)
    }
}

extension ListProductsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ListProductsTableViewCell
        guard let model = viewModel?.products[indexPath.row] else { return cell }
        cell.bind(model)
        return cell
    }
}

extension ListProductsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else { return loadData() }
        searchData(for: text)
    }
}

// MARK: - Helpers

private extension ListProductsViewController {
    
}
