//
//  AppManager.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 14/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit


struct AppManager {
    static let shared = AppManager()
    fileprivate let countryApiURL = "https://restcountries.eu/rest/v2/all"
    fileprivate let trendingMovieURL = "https://api.themoviedb.org/3/trending/all/day?api_key=820016b7116f872f5f27bf56f9fdfb66"
    
    
    // This function fetches the data from the API
    func fetchDataFromCountryAPI(completionHandler: @escaping  (Result<[CountryModel],Error>) -> ()) {
        if let url = URL(string: countryApiURL) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let httpResponse = response as? HTTPURLResponse {
                    print("CountryAPI Status: \(httpResponse.statusCode)")
                }
                
                guard let validData = data, error == nil else {
                    completionHandler(.failure(error!))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode([CountryModel].self, from: validData)
                    completionHandler(.success(decodedData))
                } catch {
                    completionHandler(.failure(error))
                }
                
            }.resume()
        }
    }
    
}

