//
//  SearchRepositoryViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchRepositoryViewController: UIViewController {
    
    private let cellId = "cellId"
    
    private var repositoryItems = [Item]()
    private var repositoryItem: Item?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        searchResultTableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        searchBar.text = "GitHubのリポジトリを検索できます"
        searchBar.delegate = self
    }
    
    private func fetchSearchRepositoryInfo(word: String) {
        
        let path = "/search/repositories"
        
        API.shared.request(word: word, path: path, type: Repository.self) { (repository) in
            print("repository",repository )
            self.repositoryItems = repository.items
            print("repositoryItems", self.repositoryItems)
            self.searchResultTableView.reloadData()
        }
    }
}

// MARK: - SearchRepositoryViewController: UITableViewDelegate, UITableViewDataSource
extension SearchRepositoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = searchResultTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchResultTableViewCell
        cell.repositoryItem = repositoryItems[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  画面遷移時に呼ばれる
        let detailRepositoryStoryboard = UIStoryboard(name: "DetailRepository", bundle: nil)
        let detailRepositoryViewController = detailRepositoryStoryboard.instantiateViewController(withIdentifier: "DetailRepositoryViewController") as! DetailRepositoryViewController
//        let item = repositoryItems[indexPath.row]
//        detailRepositoryViewController.repositoryItems = item
        self.present(detailRepositoryViewController, animated: true, completion: nil)
    }
}

// MARK: - SearchRepositoryViewController: UISearchBarDelegate
extension SearchRepositoryViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        // seachBarのtextを空にする
        searchBar.text = ""
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        guard let word = searchBar.text else { return }
        
        fetchSearchRepositoryInfo(word: word)
        
    }
}
