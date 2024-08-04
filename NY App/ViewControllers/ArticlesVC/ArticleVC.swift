//
//  ArticleVC.swift
//  NY Techno App
//
//  Created by Syed Bilal on 03/08/2024.
//

import UIKit
import Combine
import SVProgressHUD

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
        setObservers()
        
        SVProgressHUD.show()
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
    }
    
    // MARK: - setObservers()
    private func setObservers() {
        viewModel?.$notifyTableViewReload.subscribe(on: DispatchQueue.main).sink { value in
            if let value = value {
                if self.refresher.isRefreshing {
                    self.refresher.endRefreshing()
                }
                if SVProgressHUD.isVisible() {
                    SVProgressHUD.dismiss()
                }
                self.tableView.reloadData()
                self.viewModel?.notifyTableViewReload = nil
            }
        }.store(in: &cancelables)
        
        viewModel?.$errorMessage.subscribe(on: DispatchQueue.main).sink { value in
            if let value = value {
                self.showAlertDialog(title: "Alert", message: value, isTwoButtonDialog: false, callback: {})
                self.viewModel?.errorMessage = nil
            }
        }.store(in: &cancelables)
    }
}

// MARK: - extension UITableViewDelegate
extension ArticleVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.articleArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as? ArticleCell {
            if let data = viewModel?.articleArray?[indexPath.row] {
                cell.data = data
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "ArticleDetailVC") as? ArticleDetailVC {
            vc.data = viewModel?.articleArray?[indexPath.row]
            vc.modalPresentationStyle = .fullScreen
            self.navigationItem.backButtonTitle = ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

