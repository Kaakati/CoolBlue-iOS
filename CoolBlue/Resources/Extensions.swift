//
//  Extensions.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 23/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation

extension String {
    func stringByAddingPercentEncodingForFormData(plusForSpace: Bool = false) -> String? {
        let unreserved = "*-._"
        var allowed = CharacterSet.alphanumerics
        allowed.insert(charactersIn: unreserved)
        
        if plusForSpace {
            allowed.insert(charactersIn: " ")
        }
        
        var encoded = addingPercentEncoding(withAllowedCharacters: allowed)
        if plusForSpace {
            encoded = encoded?.replacingOccurrences(of: " ", with: "+")
        }
        return encoded
    }
}
