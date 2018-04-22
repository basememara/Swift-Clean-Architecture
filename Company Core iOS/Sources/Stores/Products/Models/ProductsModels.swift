//
//  ProductsModels.swift
//  Company Core iOS
//
//  Created by Basem Emara on 2018-04-19.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

public enum ProductsModels {
    
    public struct SearchRequest {
        let query: String
        
        public init(query: String) {
            self.query = query
        }
    }
}
