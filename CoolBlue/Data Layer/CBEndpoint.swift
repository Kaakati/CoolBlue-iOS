//
//  CBEndpoint.swift
//  Kaakati
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation

protocol CBEndpoint {
	var path: String { get }
	var parameters: Data? { get }
	var headers: [String: String] { get }
	var method: HTTPMethod { get }

	func request<T: Decodable>(completion: @escaping APIResponse<T>)
}

// Extending the protocol gives the advantage of declaring a function and provide the default implementation for it. can be called from any object that conforms to the protocol
extension CBEndpoint {
	func request<T: Decodable>(completion: @escaping APIResponse<T>) {
		CoolBlueAPI().startTaskWith(path: self.path, parameters: self.parameters, headers: self.headers, method: self.method, completion: completion)
	}
}
