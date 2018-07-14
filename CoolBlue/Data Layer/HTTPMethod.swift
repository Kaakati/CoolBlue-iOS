//
//  HTTPMethod.swift
//  Kaakati
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation

enum HTTPMethod {
	case get
	case post

	var name: String {
		switch self {
		case .get:
			return "GET"
		case .post:
			return "POST"
		}
	}
}
