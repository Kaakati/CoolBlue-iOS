//
//  CBRouter.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation

class CBRouter {
    
    /// Product Routes
    ///
    /// - search: get specific query with paging
    /// - details: get product details with provided id
    enum product : CBEndpoint {
        case search(query: String, page: Int)
        case details(id: Int)
        
        var path: String {
            switch self {
            case .search(let query, let page):
                return "search?query=\(query)&page=\(page)"
            case .details(let id):
                return "product/\(id)"
            }
        }
        
        var parameters: Data? {
            return nil
        }
        var headers: [String : String] {
            return [:]
        }
        var method: HTTPMethod {
            return .get
        }
        
    }
    
}
