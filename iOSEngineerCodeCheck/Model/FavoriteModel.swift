//
//  FavoriteModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 大谷空 on 2021/12/24.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation
import RealmSwift

class FavoriteModel: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var isFavorite = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}


