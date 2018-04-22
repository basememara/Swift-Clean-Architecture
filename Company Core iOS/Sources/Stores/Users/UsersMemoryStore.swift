//
//  UsersMemoryStore.swift
//  Company Core iOS
//
//  Created by Basem Emara on 2018-04-20.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import Foundation

public struct UsersMemoryStore: UsersStore {
    
    public init() {
        
    }
}

public extension UsersMemoryStore {
    
    func fetchCurrent(completion: @escaping (Result<UserType, DataError>) -> Void) {
        let user = User(
            id: 1,
            firstName: "John",
            lastName: "Doe",
            email: "john@example.com",
            updatedAt: Date(),
            createdAt: Date()
        )
        
        completion(.success(user))
    }
}
