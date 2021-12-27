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
    
    @IBOutlet private weak var repositoryTitleLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var repositoryImageView: UIImageView!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var loginNameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
        
        repositoryImageView.layer.cornerRadius = 22.5
        favoriteButton.addTarget(self, action: #selector(tappedFavoriteButton), for: .touchUpInside)
    }
    
    @objc private func tappedFavoriteButton() {
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
