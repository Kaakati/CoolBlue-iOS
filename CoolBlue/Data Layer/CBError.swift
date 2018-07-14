//
//  CBError.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation

// CoolBlue Error Handling
enum CBError {
    case notFound
    case serverError
    case badRequest
    case unauthorized
    case unprocessableEntity
    case custom(customError: CustomError)
    case unknown
    
    init(statusCode: Int) {
        switch statusCode {
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 404:
            self = .notFound
        case 422:
            self = .unprocessableEntity
        case 500..<600:
            self = .serverError
        default:
            self = .unknown
        }
    }
}

struct CustomError {
    var code : Int?
    var message : String?
}
