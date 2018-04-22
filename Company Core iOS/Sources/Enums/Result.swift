//
//  Result.swift
//  Company Core iOS
//
//  Created by Basem Emara on 2018-04-19.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import Foundation

/**
 Used to represent whether a request was successful or encountered an error.
 Taken from ZamzamKit: https://github.com/ZamzamInc/ZamzamKit/blob/master/Sources/Enums/Result.swift
 - Success: The request and all processing operations were successful resulting in the handling of the
 provided associated value.
 - Failure: The request encountered an error resulting in a failure. The associated values are the original data
 provided by the destination as well as the error that caused the failure.
 */
public enum Result<Value, ErrorType: Error> {
    case success(Value)
    case failure(ErrorType)
    
    /// Returns `true` if the result is a success, `false` otherwise.
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    /// Returns `true` if the result is a failure, `false` otherwise.
    public var isFailure: Bool {
        return !isSuccess
    }
    
    /// Returns the associated value if the result is a success, `nil` otherwise.
    public var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
    
    /// Returns the associated error value if the result is a failure, `nil` otherwise.
    public var error: ErrorType? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}
