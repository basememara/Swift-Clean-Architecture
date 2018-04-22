//
//  ShowProductModels.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import CompanyCore

enum ShowProductModels {
    
    struct FetchRequest {
        let id: Int
    }
    
    struct Response {
        let product: ProductType
    }
    
    struct ViewModel {
        let id: Int
        let name: String
        let content: String
        let price: String
    }
}
