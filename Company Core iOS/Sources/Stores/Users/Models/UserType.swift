//
//  UserType.swift
//  Company Core iOS
//
//  Created by Basem Emara on 2018-04-20.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import Foundation

public protocol UserType {
    var id: Int { get }
    var firstName: String { get }
    var lastName: String { get }
    var email: String { get }
    var updatedAt: Date { get }
    var createdAt: Date { get }
}
