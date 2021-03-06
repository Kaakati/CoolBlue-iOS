//
//  CoolBlueAPI.swift
//  Kaakati
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation

enum Result<T: Decodable> {
	case success(T)
	case failure(CBError)
}

typealias APIResponse<T: Decodable> = (Result<T>) -> Void

class CoolBlueAPI {

	var baseUrlString: String {
		#if DEBUG
			return "https://bdk0sta2n0.execute-api.eu-west-1.amazonaws.com/ios-assignment/"
		#else
			return "https://bdk0sta2n0.execute-api.eu-west-1.amazonaws.com/ios-assignment/"
		#endif
	}

	func startTaskWith<T: Decodable>(path: String, parameters: Data?, headers: [String: String], method: HTTPMethod, completion: @escaping APIResponse<T>) {
        var baseUrlString = self.baseUrlString
        baseUrlString.append(path)
        var queryString = baseUrlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
		guard let baseUrl = URL(string: queryString) else {
			// the baseUrl string is not valid
			return
		}

		var request = URLRequest(url: baseUrl)
		request.httpMethod = method.name
		request.allHTTPHeaderFields = headers
		request.httpBody = parameters

		// if the method is a GET method, the cookies should be disabled in order to allow the Authorization header to work
		if method == .get {
			request.httpShouldHandleCookies = false
		}

		URLSession.shared.dataTask(with: request) { (data, response, error) in
			guard let _ = response else {
				// TODO: handle error - nil response
				return
			}
			guard let data = data else {
				// TODO: handle error - nil data
				return
			}
			do {
				let object = try JSONDecoder().decode(T.self, from: data)
				completion(.success(object))
			} catch let err {
				print("Err", err)
				// TODO: handle error.
			}
		}.resume()
	}
}
