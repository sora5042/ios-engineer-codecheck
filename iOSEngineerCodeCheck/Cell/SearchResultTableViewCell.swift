//
//  SearchResultTableViewCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 大谷空 on 2021/12/22.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit
import Nuke

class SearchResultTableViewCell: UITableViewCell {
    
    var repositoryItem: Item? {
        didSet {
            
            if let loginName = repositoryItem?.owner.login {
                loginNameLabel.text = loginName
            }
            
            if let repositoryTitle = repositoryItem?.full_name {
                repositoryTitleLabel.text = repositoryTitle
            }
            
            if let language = repositoryItem?.language {
                languageLabel.text = language
            }
            
            if let description = repositoryItem?.description {
                descriptionTextView.text = description
                
            }
            
            if let url = URL(string: repositoryItem?.owner.avatar_url ?? "") {
                Nuke.loadImage(with: url, into: repositoryImageView )
            }
            
        }
    }
    
    @IBOutlet weak var repositoryTitleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var repositoryImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var loginNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
        
        repositoryImageView.layer.cornerRadius = 22.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
