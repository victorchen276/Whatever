//
//  NewsModel.swift
//  Whatever
//
//  Created by Chen Yue on 2/09/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String?
}


class ArticleViewModel: Identifiable {
    
    let id = UUID()
    
    let article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description ?? ""
    }
    
    
}
