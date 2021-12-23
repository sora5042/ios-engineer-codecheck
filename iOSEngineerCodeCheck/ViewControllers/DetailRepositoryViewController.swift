//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import Nuke

class DetailRepositoryViewController: UIViewController {
    
    var repositoryItems = [Item]()
    var repositoryItem: Item?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var watchesLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var issuesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        
        titleLabel?.text = repositoryItem?.full_name
        languageLabel?.text = "Written in \(repositoryItem?.language)"
        starsLabel?.text = "\(String(repositoryItem?.stargazers_count ?? 0)) stars"
        watchesLabel?.text = "\(String(repositoryItem?.watchers_count ?? 0)) watchers"
        forksLabel?.text = "\(String(repositoryItem?.forks_count ?? 0)) forks"
        issuesLabel?.text = "\(String(repositoryItem?.open_issues_count ?? 0)) open issues"
        
        if let url = URL(string: repositoryItem?.owner.avatar_url ?? "") {
            Nuke.loadImage(with: url, into: imageView)
        }
    }
}

