//
//  ArticleListViewModel.swift
//  NY Techno App
//
//  Created by Syed Bilal on 03/08/2024.
//

import Foundation
import Combine

class ArticleListViewModel {
    
    @Published var notifyTableViewReload: Bool? = nil
    @Published var errorMessage: String? = nil
    
    var repository: ArticleRepository? = nil
    var articleArray: [ArticleData]? = nil

    init(repository: ArticleRepository) {
        self.repository = repository
    }
    
    // MARK: - getArticlesApi()
    func getArticlesApi() {
        repository?.getArticles(section: .AllSections, period: .Week, completion: { [weak self] status, response, error in
            guard let strongSelf = self else { return }
            
            switch status {
            case .SUCCESS: 
                if let response = response, response.status == STATUS_OK {
                    strongSelf.articleArray = response.results ?? [ArticleData]()
                } else {
                    strongSelf.errorMessage = ERROR_MESSAGE
                }
                break
            case .ERROR:
                strongSelf.errorMessage = error?.localizedDescription ?? ERROR_MESSAGE
            case .FAILED: 
                strongSelf.errorMessage = error?.localizedDescription ?? ERROR_MESSAGE
            }
            strongSelf.notifyTableViewReload = true
        })
    }
}
