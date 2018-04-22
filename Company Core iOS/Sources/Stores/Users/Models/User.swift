//
//  User.swift
//  Company Core iOS
//
//  Created by Basem Emara on 2018-04-20.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import Foundation

public struct User: UserType {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let email: String
    public let updatedAt: Date
    public let createdAt: Date
}
