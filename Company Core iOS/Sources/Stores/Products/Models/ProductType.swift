//
//  ProductType.swift
//  Company Core iOS
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import Foundation

public protocol ProductType {
    var id: Int { get }
    var name: String { get }
    var content: String { get }
    var priceCents: Int { get }
    var updatedAt: Date { get }
    var createdAt: Date { get }
}
