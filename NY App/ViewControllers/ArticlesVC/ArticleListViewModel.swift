//
//  ArticleListViewModel.swift
//  NY Techno App
//
//  Created by Syed Bilal on 03/08/2024.
//

import Foundation
import Combine

class ArticleListViewModel {
    
    
    var repository: ArticleRepository? = nil

    init(repository: ArticleRepository) {
        self.repository = repository
    }
    
    // MARK: - getArticlesApi()
    func getArticlesApi() {
        repository?.getArticles()
    }
}
