//
//  SearchResultTableViewCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 大谷空 on 2021/12/22.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit
import RealmSwift
import Nuke

protocol ArticleCellDelegate: AnyObject {
    func reloadCell(index: IndexPath, favoriteModel: FavoriteModel)
}

class SearchResultTableViewCell: UITableViewCell {
    
    weak var delegate: ArticleCellDelegate?
    var index: IndexPath = []
    
    var favoriteModel = FavoriteModel()
    var favoriteModels: FavoriteModel?
    var repositoryItem: Item? {
        didSet {
            
            if let repositoryTitle = repositoryItem?.fullName {
                repositoryTitleLabel.text = repositoryTitle
            }
            
            if let loginName = repositoryItem?.owner.login {
                loginNameLabel.text = loginName
            }
            
            if let language = repositoryItem?.language {
                languageLabel.text = language
            }
            
            if let description = repositoryItem?.description {
                descriptionTextView.text = description
            }
            
            if let url = URL(string: repositoryItem?.owner.avatarUrl ?? "") {
                Nuke.loadImage(with: url, into: repositoryImageView)
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
    
    private func fetchFavoriteInfo() {
        let realm = try! Realm()
        let result = realm.objects(FavoriteModel.self)
        
        for favorite in result {
            favoriteModels = favorite
        }
    }
    // お気に入りボタンタップ時の処理
    @objc private func tappedFavoriteButton() {
        if favoriteModels == nil {
            createFavoriteData()
        } else {
            updateFavoritedata()
        }
        
        fetchFavoriteInfo()
        delegate?.reloadCell(index: index, favoriteModel: favoriteModel)
    }
    
    private func createFavoriteData() {
        let id = UUID().uuidString
        
        do {
            let realm = try Realm()
            favoriteModel.id = id
            favoriteModel.isFavorite = true
            
            try realm.write {
                realm.add(favoriteModel)
            }
        } catch {
            print(error, "Favorite情報の保存に失敗しました")
        }
    }
    
    private func updateFavoritedata() {
        guard let id = favoriteModels?.id else { return }
        if favoriteModel.isFavorite == true {
            
            do {
                let realm = try Realm()
                favoriteModel.id = id
                favoriteModel.isFavorite = false
                
                try realm.write {
                    realm.add(favoriteModel, update: .modified)
                }
            } catch {
                print(error, "Favorite情報の更新に失敗しました")
            }
        } else {
            
            do {
                let realm = try Realm()
                favoriteModel.id = id
                favoriteModel.isFavorite = true
                
                try realm.write {
                    realm.add(favoriteModel, update: .modified)
                }
            } catch {
                print(error, "Favorite情報の更新に失敗しました")
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
