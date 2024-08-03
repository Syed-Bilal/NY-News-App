//
//  ViewController.swift
//  NY Techno App
//
//  Created by Syed Bilal on 03/08/2024.
//

import UIKit
import Combine

class ArticleVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ArticleListViewModel? = nil
    
    var refresher: UIRefreshControl!
    var cancelables = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ArticleListViewModel(repository: ArticleRepository())
        
        setTableView()
        loadRefresher()
        viewModel?.getArticlesApi()
    }
    
    // MARK: - setTableView()
    func setTableView() {
        tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: ArticleCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - loadRefresher()
    private func loadRefresher() {
        refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refresher
    }
    
    // MARK: - refreshData()
    @objc func refreshData() {
        viewModel?.getArticlesApi()
        refresher.endRefreshing()
    }
}

// MARK: - extension UITableViewDelegate
extension ArticleVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as? ArticleCell {
            cell.data = ""
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "ArticleDetailVC") as? ArticleDetailVC {
            vc.modalPresentationStyle = .fullScreen
            self.navigationItem.backButtonTitle = "Back"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

