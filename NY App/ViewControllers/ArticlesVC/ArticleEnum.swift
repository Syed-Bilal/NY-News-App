//
//  ArticleEnum.swift
//  NY App
//
//  Created by Syed Bilal on 03/08/2024.
//

import Foundation

enum ArticleSectionEnum : String {
    
    case AllSections = "all-sections"
}

enum ArticlePeriodEnum : Int {
    
    case Day = 1
    case Week = 7
    case Month = 30
}

enum ArticleMediaTypeEnum : String {
    
    case Unknown = ""
    case image = "image"
    
    static func fromString(rawValue: String) -> ArticleMediaTypeEnum {
        if let value = ArticleMediaTypeEnum(rawValue: rawValue) {
            return value
        }
        return .Unknown
    }
    
    
}
