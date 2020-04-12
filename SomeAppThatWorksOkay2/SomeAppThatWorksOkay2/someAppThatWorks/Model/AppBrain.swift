//
//  AppBrain.swift
//  someAppThatWorks
//
//  Created by Yasharth Saxena on 12/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

struct AppBrain {
    
    let section2Array = [CellDetail(title: "Track Order", image: UIImage(systemName: "location.slash")),
                         CellDetail(title: "Size Chart", image: UIImage(systemName: "arrow.up.left.and.arrow.down.right")),
                         CellDetail(title: "Notifications", image: UIImage(systemName: "bell")),
                         CellDetail(title: "Store Locator", image: UIImage(systemName: "location.circle"))]
    
    let section3Array = [CellDetail(title: "Country", image: UIImage(systemName: "globe")),
                         CellDetail(title: "Language", image: UIImage(systemName: "textformat.alt")),
                         CellDetail(title: "About Us", image: UIImage(systemName: "person")),
                         CellDetail(title: "FAQ", image: UIImage(systemName: "questionmark.circle")),
                         CellDetail(title: "Shipping & Returns", image: UIImage(systemName: "cube.box"))]
}

struct CellDetail {
    let title: String?
    let image: UIImage?
}
