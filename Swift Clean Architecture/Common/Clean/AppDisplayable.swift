//
//  AppDisplayable.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit

protocol AppDisplayable {
    func display(error: AppModels.Error)
}

extension AppDisplayable where Self: UIViewController {
    
    func display(error: AppModels.Error) {
        let alertController = UIAlertController(
            title: error.title,
            message: error.message,
            preferredStyle: .alert
        )
        
        alertController.addAction(
            UIAlertAction(title: "OK", style: .default, handler: nil)
        )
        
        guard let rootController = UIApplication.shared.keyWindow?.rootViewController else { return }
        rootController.present(alertController, animated: true, completion: nil)
    }
}
