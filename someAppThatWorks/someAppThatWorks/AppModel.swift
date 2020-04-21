//
//  AppModel.swift
//  someAppThatWorks
//
//  Created by Yasharth Saxena on 20/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

struct AppModel {
    
    static let shared = AppModel() 
    
    let section2Array = [CellDetail(title: "Track Order", image: UIImage(systemName: "location.slash")),
                         CellDetail(title: "Size Chart", image: UIImage(systemName: "arrow.up.left.and.arrow.down.right")),
                         CellDetail(title: "Notifications", image: UIImage(systemName: "bell")),
                         CellDetail(title: "Store Locator", image: UIImage(systemName: "location.circle"))]
    
    let section3Array = [CellDetail(title: "Country", image: UIImage(systemName: "globe")),
                         CellDetail(title: "Language", image: UIImage(systemName: "textformat.alt")),
                         CellDetail(title: "About Us", image: UIImage(systemName: "person")),
                         CellDetail(title: "FAQ", image: UIImage(systemName: "questionmark.circle")),
                         CellDetail(title: "Shipping & Returns", image: UIImage(systemName: "cube.box"))]
    
    let statusCodeResponses = [100: "Continue",
            101: "Switching Protocols",
            102: "Processing",

            200: "OK",
            201: "Created",
            202: "Accepted",
            203: "Non-authoritative Information",
            204: "No Content",
            205: "Reset Content",
            206: "Partial Content",
            207: "Multi-Status",
            208: "Already Reported",
            226: "IM Used",

            300: "Multiple Choices",
            301: "Moved Permanently",
            302: "Found",
            303: "See Other",
            304: "Not Modified",
            305: "Use Proxy",
            307: "Temporary Redirect",
            308: "Permanent Redirect",

            400: "Bad Request",
            401: "Unauthorized",
            402: "Payment Required",
            403: "Forbidden",
            404: "Not Found",
            405: "Method Not Allowed",
            406: "Not Acceptable",
            407: "Proxy Authentication Required",
            408: "Request Timeout",
            409: "Conflict",
            410: "Gone",
            411: "Length Required",
            412: "Precondition Failed",
            413: "Payload Too Large",
            414: "Request-URI Too Long",
            415: "Unsupported Media Type",
            416: "Requested Range Not Satisfiable",
            417: "Expectation Failed",
            418: "I'm a teapot",
            421: "Misdirected Request",
            422: "Unprocessable Entity",
            423: "Locked",
            424: "Failed Dependency",
            426: "Upgrade Required",
            428: "Precondition Required",
            429: "Too Many Requests",
            431: "Request Header Fields Too Large",
            444: "Connection Closed Without Response",
            451: "Unavailable For Legal Reasons",
            499: "Client Closed Request",

            500: "Internal Server Error",
            501: "Not Implemented",
            502: "Bad Gateway",
            503: "Service Unavailable",
            504: "Gateway Timeout",
            505: "HTTP Version Not Supported",
            506: "Variant Also Negotiates",
            507: "Insufficient Storage",
            508: "Loop Detected",
            510: "Not Extended",
            511: "Network Authentication Required",
            599: "Network Connect Timeout Error"
    ]
    
    func registerNibs(for table: UITableView) {
        
        let countryNib = UINib(nibName: "CountryCell", bundle: nil)
        let languageNib = UINib(nibName: "LanguageCell", bundle: nil)
        let normalNib = UINib(nibName: "NormalCell", bundle: nil)
        
        table.register(countryNib, forCellReuseIdentifier: "countryCell")
        table.register(languageNib, forCellReuseIdentifier: "languageCell")
        table.register(normalNib, forCellReuseIdentifier: "normalCell")
        
    }
    
    
    
}

struct CellDetail {
    let title: String?
    let image: UIImage?
}
