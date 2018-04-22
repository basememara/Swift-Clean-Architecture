//
//  ListProductsTableViewCell.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-19.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit

class ListProductsTableViewCell: UITableViewCell {

    // MARK: - Controls
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
}

extension ListProductsTableViewCell {
    
    func bind(_ model: ListProductsModels.ProductViewModel) {
        idLabel.text = "\(model.id)"
        nameLabel.text = model.name
        priceLabel.text = model.price
    }
}
