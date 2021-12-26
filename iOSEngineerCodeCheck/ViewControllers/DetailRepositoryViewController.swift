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
    
    var repositoryItem: Item?
       
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!
    @IBOutlet private weak var watchesLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var issuesLabel: UILabel!
    @IBOutlet private weak var licenseLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var titleView: UIView!
    @IBOutlet private weak var countView: UIView!
    @IBOutlet private weak var licenseView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupRepositoryItem()
    }
    
    private func setupViews() {
        
        titleView.layer.borderWidth = 1
        titleView.layer.borderColor = UIColor.lightGray.cgColor
        countView.layer.borderWidth = 1
        countView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.cornerRadius = 25
        licenseView.layer.borderWidth = 1
        licenseView.layer.borderColor = UIColor.lightGray.cgColor
        
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
    }
    
    private func setupRepositoryItem() {
        
        descriptionTextView.text = repositoryItem?.description
        titleLabel.text = repositoryItem?.full_name
        languageLabel.text = "written in \(repositoryItem?.language ?? "")"
        starsLabel.text = String(repositoryItem?.stargazers_count ?? 0)
        watchesLabel.text = String(repositoryItem?.watchers_count ?? 0)
        forksLabel.text = String(repositoryItem?.forks_count ?? 0)
        issuesLabel.text = String(repositoryItem?.open_issues_count ?? 0)
        
        licenseLabel.text = repositoryItem?.license?.name
        
        if let url = URL(string: repositoryItem?.owner.avatar_url ?? "") {
            Nuke.loadImage(with: url, into: imageView)
        }
    }
    
    @objc private func tappedBackButton() {
        
        dismiss(animated: true, completion: nil)
    }
}

