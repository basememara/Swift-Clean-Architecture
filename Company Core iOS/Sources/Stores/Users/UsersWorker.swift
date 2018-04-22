//
//  UsersWorker.swift
//  Company Core iOS
//
//  Created by Basem Emara on 2018-04-20.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

public struct UsersWorker: UsersWorkerType {
    private let store: UsersStore
    
    public init(store: UsersStore) {
        self.store = store
    }
}

public extension UsersWorker {
    
    func fetchCurrent(completion: @escaping (Result<UserType, DataError>) -> Void) {
        store.fetchCurrent(completion: completion)
    }
}
