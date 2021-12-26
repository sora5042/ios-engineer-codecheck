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
    
    var repository: [[String: Any]]=[]
    var task: URLSessionTask?
    var word: String!
    var url: String!
    var index: Int!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        searchResultTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        searchBar.text = "GitHubのリポジトリを検索できます"
        searchBar.delegate = self
    }
}

// MARK: - SearchRepositoryViewController: UITableViewDelegate, UITableViewDataSource
extension SearchRepositoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repository.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = searchResultTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let repository = repository[indexPath.row]
        cell.textLabel?.text = repository["full_name"] as? String ?? ""
        cell.detailTextLabel?.text = repository["language"] as? String ?? ""
        cell.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  画面遷移時に呼ばれる
        index = indexPath.row
        let detailRepositoryStoryboard = UIStoryboard(name: "DetailRepository", bundle: nil)
        let detailRepositoryViewController = detailRepositoryStoryboard.instantiateViewController(withIdentifier: "DetailRepositoryViewController") as! DetailRepositoryViewController
        detailRepositoryViewController.repository = self.repository
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        task?.cancel()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        word = searchBar.text!
        
        if word.count != 0 {
            url = "https://api.github.com/search/repositories?q=\(word!)"
            task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, res, err) in
                if let object = try! JSONSerialization.jsonObject(with: data!) as? [String: Any] {
                    if let items = object["items"] as? [[String: Any]] {
                        self.repository = items
                        DispatchQueue.main.async {
                            self.searchResultTableView.reloadData()
                        }
                    }
                }
            }
            // これ呼ばなきゃリストが更新されません
            task?.resume()
        }
        
    }
    
}
