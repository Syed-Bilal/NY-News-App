//
//  ArticleRepository.swift
//  NY Techno App
//
//  Created by Syed Bilal on 03/08/2024.
//

import Foundation
import Alamofire

class ArticleRepository {
    
    // MARK: - getArticles()
    func getArticles(section: ArticleSectionEnum, period: ArticlePeriodEnum, completion: @escaping completion<ArticleResponse>) {
        NetworkManager.instance.ApiRequest(baseUrl: .mostPopular, endpoint: ArticleEndPoints.articles(section: section, period: period, key: NY_API_KEY), method: .get, encoding: JSONEncoding.default, params: nil) { (response: ArticleResponse?, error: Error?) in
            handleResponse(response: response, error: error) { status, response, error in
                completion(status, response, error)
            }
        }
    }
}
