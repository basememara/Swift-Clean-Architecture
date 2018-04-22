//
//  ShowProfileModels.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import CompanyCore

enum ShowProfileModels {
    
    struct FetchRequest {
        
    }
    
    struct Response {
        let user: UserType
    }
    
    struct ViewModel {
        let id: Int
        let name: String
        let email: String
    }
}
