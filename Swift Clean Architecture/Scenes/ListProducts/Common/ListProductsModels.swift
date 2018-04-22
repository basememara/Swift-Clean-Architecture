//
//  ListProductsModels.swift
//  Swift Clean Architecture
//
//  Created by Basem Emara on 2018-04-18.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import CompanyCore

enum ListProductsModels {
    
    struct FetchRequest {
        
    }
    
    struct SearchRequest {
        let text: String
    }
    
    struct Response {
        let products: [ProductType]
    }
    
    struct ViewModel {
        let products: [ProductViewModel]
    }
    
    struct ProductViewModel {
        let id: Int
        let name: String
        let content: String
        let price: String
    }
}
