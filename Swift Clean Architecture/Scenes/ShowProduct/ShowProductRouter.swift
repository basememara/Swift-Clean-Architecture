//
//  ShowProductRouter.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit

struct ShowProductRouter {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}

extension ShowProductRouter: ShowProductRoutable {
    
}
