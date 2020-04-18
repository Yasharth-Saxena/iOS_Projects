//
//  AppManager.swift
//  Sdsgsdfh
//
//  Created by Yasharth Saxena on 18/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import Foundation

struct AppManager {
    
    static let shared = AppManager()
    fileprivate let baseURLString = "https://restcountries.eu/rest/v2/all"
    
    func performRequest(completion: @escaping (Result<[AppModel], Error>) -> Void) {
        
        if let url = URL(string: baseURLString) {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("API Status: \(httpResponse.statusCode)")
                }
                
                guard let validData = data, error == nil else {
                    completion(.failure(error!))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode([AppModel].self, from: validData)
                    completion(.success(decodedData))
                } catch let serializationError {
                    completion(.failure(serializationError))
                }
                
                
            }.resume()
        }
    }
}
