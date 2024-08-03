//
//  ArticleModels.swift
//  NY Techno App
//
//  Created by Syed Bilal on 03/08/2024.
//

import Foundation

// MARK: - ArticleResponse
struct ArticleResponse : Codable {
    let status : String?
    let copyright : String?
    let num_results : Int?
    let results : [ArticleData]?
}

// MARK: - ArticleData
struct ArticleData : Codable {
    let uri : String?
    let url : String?
    let id : Int?
    let asset_id : Int?
    let source : String?
    let published_date : String?
    let updated : String?
    let section : String?
    let subsection : String?
    let nytdsection : String?
    let adx_adx_keywordswords : String?
    let column : String?
    let byline : String?
    let type : String?
    let title : String?
    let abstract : String?
    let des_facet : [String]?
    let org_facet : [String]?
    let per_facet : [String]?
    let geo_facet : [String]?
    let media : [MediaData]?
    let eta_id : Int?
}

// MARK: - MediaData
struct MediaData : Codable {
    let type : String?
    let subtype : String?
    let caption : String?
    let copyright : String?
    let approvedForSyndication : Int?
    let mediaMetaData : [MediaMetaData]?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetaData = "media-metadata"
    }
}

// MARK: - MediaMetaData
struct MediaMetaData : Codable {
    let url : String?
    let format : String?
    let height : Int?
    let width : Int?
}
