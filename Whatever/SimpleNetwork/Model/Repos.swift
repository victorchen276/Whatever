//
//  Repos.swift
//  Whatever
//
//  Created by Chen Yue on 19/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import Foundation

struct Repos: Codable {
    let total_count: Int
    let items: [Repo]
}

struct Repo: Codable {
    let name: String
    let description: String
    let owner: User
    let language: String
    let stargazers_count: Int
}

struct User: Codable {
    let login: String
    let url: String
    let name: String?
    let avatar_url: String?
    let bio: String?
}
