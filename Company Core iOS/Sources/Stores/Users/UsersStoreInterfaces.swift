//
//  ProductsStoreInterfaces.swift
//  Company Core iOS
//
//  Created by Basem Emara on 2018-04-20.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

public protocol UsersStore {
    func fetchCurrent(completion: @escaping (Result<UserType, DataError>) -> Void)
}

public protocol UsersWorkerType: UsersStore {
    
}
