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
    
//    enum CodingKeys: String, CodingKey {
//
//        case status = "status"
//        case copyright = "copyright"
//        case num_results = "num_results"
//        case results = "results"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        status = try values.decodeIfPresent(String.self, forKey: .status)
//        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
//        num_results = try values.decodeIfPresent(Int.self, forKey: .num_results)
//        results = try values.decodeIfPresent([ArticleData].self, forKey: .results)
//    }

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
    let adx_keywords : String?
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
    
//    enum CodingKeys: String, CodingKey {
//
//        case uri = "uri"
//        case url = "url"
//        case id = "id"
//        case assetId = "asset_id"
//        case source = "source"
//        case published_date = "published_date"
//        case updated = "updated"
//        case section = "section"
//        case subsection = "subsection"
//        case nytdsection = "nytdsection"
//        case adxKeywords = "adx_keywords"
//        case column = "column"
//        case byline = "byline"
//        case type = "type"
//        case title = "title"
//        case abstract = "abstract"
//        case desFacet = "des_facet"
//        case orgFacet = "org_facet"
//        case perFacet = "per_facet"
//        case geoFacet = "geo_facet"
//        case media = "media"
//        case etaId = "eta_id"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        uri = try values.decodeIfPresent(String.self, forKey: .uri)
//        url = try values.decodeIfPresent(String.self, forKey: .url)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        assetId = try values.decodeIfPresent(Int.self, forKey: .assetId)
//        source = try values.decodeIfPresent(String.self, forKey: .source)
//        published_date = try values.decodeIfPresent(String.self, forKey: .published_date)
//        updated = try values.decodeIfPresent(String.self, forKey: .updated)
//        section = try values.decodeIfPresent(String.self, forKey: .section)
//        subsection = try values.decodeIfPresent(String.self, forKey: .subsection)
//        nytdsection = try values.decodeIfPresent(String.self, forKey: .nytdsection)
//        adxKeywords = try values.decodeIfPresent(String.self, forKey: .adxKeywords)
//        column = try values.decodeIfPresent(String.self, forKey: .column)
//        byline = try values.decodeIfPresent(String.self, forKey: .byline)
//        type = try values.decodeIfPresent(String.self, forKey: .type)
//        title = try values.decodeIfPresent(String.self, forKey: .title)
//        abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
//        desFacet = try values.decodeIfPresent([String].self, forKey: .desFacet)
//        orgFacet = try values.decodeIfPresent([String].self, forKey: .orgFacet)
//        perFacet = try values.decodeIfPresent([String].self, forKey: .perFacet)
//        geoFacet = try values.decodeIfPresent([String].self, forKey: .geoFacet)
//        media = try values.decodeIfPresent([MediaData].self, forKey: .media)
//        etaId = try values.decodeIfPresent(Int.self, forKey: .etaId)
//    }
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
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        type = try values.decodeIfPresent(String.self, forKey: .type)
//        subtype = try values.decodeIfPresent(String.self, forKey: .subtype)
//        caption = try values.decodeIfPresent(String.self, forKey: .caption)
//        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
//        approvedForSyndication = try values.decodeIfPresent(Int.self, forKey: .approvedForSyndication)
//        mediaMetaData = try values.decodeIfPresent([MediaMetaData].self, forKey: .mediaMetaData)
//    }
}

// MARK: - MediaMetaData
struct MediaMetaData : Codable {
    let url : String?
    let format : String?
    let height : Int?
    let width : Int?
    
//    enum CodingKeys: String, CodingKey {
//        case url = "url"
//        case format = "format"
//        case height = "height"
//        case width = "width"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        url = try values.decodeIfPresent(String.self, forKey: .url)
//        format = try values.decodeIfPresent(String.self, forKey: .format)
//        height = try values.decodeIfPresent(Int.self, forKey: .height)
//        width = try values.decodeIfPresent(Int.self, forKey: .width)
//    }

}
