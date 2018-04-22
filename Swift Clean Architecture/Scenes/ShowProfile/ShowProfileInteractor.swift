//
//  ShowProfileInteractor.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import CompanyCore

struct ShowProfileInteractor {
    private let presenter: ShowProfilePresentable
    private let usersWorker: UsersWorkerType
    
    init(presenter: ShowProfilePresentable, usersWorker: UsersWorkerType) {
        self.presenter = presenter
        self.usersWorker = usersWorker
    }
}

extension ShowProfileInteractor: ShowProfileBusinessLogic {
    
    func fetchUser(with request: ShowProfileModels.FetchRequest) {
        usersWorker.fetchCurrent {
            guard let value = $0.value, $0.isSuccess else {
                return self.presenter.presentFetchedUser(error: $0.error ?? .unknownReason(nil))
            }
            
            self.presenter.presentFetchedUser(
                for: ShowProfileModels.Response(user: value)
            )
        }
    }
}
