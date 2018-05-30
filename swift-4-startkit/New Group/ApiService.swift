//
//  File.swift
//  swift-4-startkit
//
//  Created by Daniel C L on 30/05/2018.
//  Copyright © 2018 Daniel C L. All rights reserved.
//

import Foundation

typealias ServiceResponse = ([[String: Any]], NSError?) -> Void


class ApiService {
    
    static func makeGetCall(endpoint: String, onCompletion: @escaping ServiceResponse) {
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: {(data, response, error) in
            guard error == nil else {
                print("error calling GET on" + endpoint)
                print(error!)
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            do {
                guard let result = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [[String: Any]] else {
                        
                        print("error trying to convert data to JSON")
                        return
                }
                onCompletion(result, nil)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        })
        task.resume()
    }
}


