//
//  AppBrain.swift
//  someAppThatWorks
//
//  Created by Yasharth Saxena on 12/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

protocol AppManagerDelegate {
    func setFlagImage(image: UIImage)
}

struct AppManager {
    
    
    static let shared = AppManager()
    var delegate: AppManagerDelegate?
    
    fileprivate let countryURLString = "https://restcountries.eu/rest/v2/all"
    
    func getCountries(completion: @escaping (Result<[CountryModel], Error>) -> Void) {
        
        if let url = URL(string: countryURLString) {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("CountryAPI Status: \(httpResponse.statusCode), \(AppModel.shared.statusCodeResponses[httpResponse.statusCode] ?? "someOther response message")" )
                }
                
                guard let validData = data, error == nil else {
                    completion(.failure(error!))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode([CountryModel].self, from: validData)
                    completion(.success(decodedData))
                } catch let serializationError {
                    completion(.failure(serializationError))
                }
                
            }.resume()
        }
    }
    
    func getCountryCode(countryCode: String) {
        let urlString = "https://www.countryflags.io/\(countryCode)/flat/64.png"
        self.getFlags(urlString: urlString)
    }
    
    func getFlags(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                guard let data = data, error == nil else {
                    print(error!)
                    return
                }
                
                if let downloadedImage = UIImage(data: data) {
                    self.delegate?.setFlagImage(image: downloadedImage)
                }
            }
        }
        
    }
    
}



