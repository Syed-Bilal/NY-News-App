//
//  ArticleEndPoints.swift
//  NY Techno App
//
//  Created by Syed Bilal on 03/08/2024.
//

import Foundation

enum ArticleEndPoints: BaseApiConfiguration {
    
    case articles(section: String, period: Int, key: String)
    
    var path: String {
        switch self {
        case .articles(let section, let period, let key):
            return "mostpopular/v2/mostviewed/\(section)/\(period).json?api-key=\(key)"
        }
    }
}
