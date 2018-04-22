//
//  ListProductsRouter.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit

struct ListProductsRouter {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}

extension ListProductsRouter: ListProductsRoutable {
    
    func showProduct(for id: Int) {
        show(storyboard: .showProduct) { (controller: ShowProductViewController) in
            controller.productID = id
        }
    }
    
    func showBookmark() {
        present(safari: "http://basememara.com")
    }
}
