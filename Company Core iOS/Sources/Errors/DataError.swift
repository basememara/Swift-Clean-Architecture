//
//  DataError.swift
//  Company Core iOS
//
//  Created by Basem Emara on 2018-04-19.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

public enum DataError: Error {
    case nonExistent
    case unauthorized
    case noInternet
    case parseFailure(Error?)
    case databaseFailure(Error?)
    case cacheFailure(Error?)
    case networkFailure(Error?)
    case unknownReason(Error?)
}
