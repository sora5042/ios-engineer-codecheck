//
//  SearchResultTableViewCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 大谷空 on 2021/12/22.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    var repositoryItem: Item? {
        didSet {
            
            if let repositoryTitle = repositoryItem?.full_name {
                repositoryTitleLabel.text = repositoryTitle
            }
            
            if let language = repositoryItem?.language {
                languageLabel.text = language
            }
        }
    }
    
    @IBOutlet weak var repositoryTitleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
