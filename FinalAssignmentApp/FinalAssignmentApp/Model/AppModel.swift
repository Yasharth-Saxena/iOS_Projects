//
//  AppModel.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 13/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

struct AppModel {
    
    static let shared = AppModel()
    
    
    //MARK: accountTableViewArrays
    let section1Array = [CellDetail(title: "Location", image: UIImage(systemName: "location.slash")),
                         CellDetail(title: "Movies", image: UIImage(systemName: "arrow.up.left.and.arrow.down.right")),
                         CellDetail(title: "Notifications", image: UIImage(systemName: "bell")),
                         CellDetail(title: "My Circle", image: UIImage(systemName: "location.circle"))]
    
    let section2Array = [CellDetail(title: "Country", image: UIImage(systemName: "globe")),
                         CellDetail(title: "Language", image: UIImage(systemName: "textformat.alt")),
                         CellDetail(title: "About Us", image: UIImage(systemName: "person")),
                         CellDetail(title: "FAQs", image: UIImage(systemName: "questionmark.circle")),
                         CellDetail(title: "Change Theme", image: UIImage(systemName: "cube.box"))]
    
    
    //MARK: LanguageArray
    let languageArray = ["English (US)", "British English", "Australian English", "Indian English", "French", "French Canadian", "Italian", "Spanish", "Portuguese", "Portuguese", "Catalan", "Croatian",  "German", "Dutch", "Danish", "Swedish", "Finnish", "Norwegian", "Russian", "Czech", "Slovak", "Polish", "Croatian", "Romanian", "Turkish", "Ukrainian", "Hungarian", "Traditional Chinese", "Simplified Chinese", "Korean", "Japanese", "Vietnamese", "Arabic", "Thai", "Greek", "Hebrew", "Indonesian", "Malay"]
    
    
    
    //MARK: RoundImage
    // this function makes the image on the Account Screen rounded
    func roundImage(_ imageView: UIImageView) {
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .black
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
    }
    
    
    
    //MARK: RegisterNibs
    // this function registers the nib files for the custom TableViewCells for the AccountScreen
    func registerNibs(for tableView: UITableView) {
        let normalNib = UINib(nibName: "NormalCell", bundle: nil)
        let countryNib = UINib(nibName: "CountryCell", bundle: nil)
        let languageNib = UINib(nibName: "LanguageCell", bundle: nil)
        
        tableView.register(normalNib, forCellReuseIdentifier: "normalCell")
        tableView.register(countryNib, forCellReuseIdentifier: "countryCell")
        tableView.register(languageNib, forCellReuseIdentifier: "languageCell")
    }
    
}

struct CellDetail {
    let title: String
    let image: UIImage?
}
