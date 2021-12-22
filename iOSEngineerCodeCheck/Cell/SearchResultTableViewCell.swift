//
//  SearchResultTableViewCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 大谷空 on 2021/12/22.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var repositoryTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
