//
//  Repository.swift
//  iOSEngineerCodeCheck
//
//  Created by 大谷空 on 2021/12/22.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    
    let items: [Item]
}

struct Item: Decodable {
    
    let id: Int
    let name: String
    let fullName: String
    let stargazersCount: Int
    let watchersCount: Int
    let language: String?
    let description: String?
    let forksCount: Int
    let openIssuesCount: Int
    let owner: Owner
    let license: License?
}

struct Owner: Decodable {
    
    let avatarUrl: String
    let url: String
    let htmlUrl: String
}

struct License: Decodable {
    
    let name: String
}
