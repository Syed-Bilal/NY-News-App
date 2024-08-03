//
//  ArticleEndPoints.swift
//  NY Techno App
//
//  Created by Syed Bilal on 03/08/2024.
//

import Foundation

enum ArticleEndPoints: BaseApiConfiguration {
    
    case articles(section: ArticleSectionEnum, period: ArticlePeriodEnum, key: String)
    
    var path: String {
        switch self {
        case .articles(let section, let period, let key):
            return "mostviewed/\(section.rawValue)/\(period.rawValue).json?api-key=\(key)"
        }
    }
}
