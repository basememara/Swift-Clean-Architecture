//
//  Product.swift
//  Company Core iOS
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import Foundation

public struct Product: ProductType {
    public let id: Int
    public let name: String
    public let content: String
    public let priceCents: Int
    public let updatedAt: Date
    public let createdAt: Date
}
