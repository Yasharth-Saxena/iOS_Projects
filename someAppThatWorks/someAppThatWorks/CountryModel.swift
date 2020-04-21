//
//  CountryModel.swift
//  someAppThatWorks
//
//  Created by Yasharth Saxena on 19/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import Foundation

struct CountryModel: Decodable {
    
    let name: String
    let alpha2Code: String
    let languages: [Languages]
}

struct Languages: Decodable {
    let language: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        
        case name, language = "iso639_2"
    }
}

