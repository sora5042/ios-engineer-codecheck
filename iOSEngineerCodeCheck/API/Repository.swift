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
    let full_name: String
    let stargazers_count: Int
    let watchers_count: Int
    let language: String?
    let forks_count: Int
    let open_issues_count: Int
    let owner: Owner
    
}

struct Owner: Decodable {
    
    let avatar_url: String
    let url: String
    let html_url: String
}
