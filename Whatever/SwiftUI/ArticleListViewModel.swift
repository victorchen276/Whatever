//
//  ArticleListViewModel.swift
//  Whatever
//
//  Created by Chen Yue on 2/09/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import Foundation
import Combine


class ArticleListViewModel: ObservableObject {
    
    let didChange = PassthroughSubject<ArticleListViewModel,Never>()
    
    init() {
        fetchTopHeadlines()
    }
    
    @Published var articles = [ArticleViewModel]() {
        didSet {
            didChange.send(self)
        }
    }
    
    private func fetchTopHeadlines() {
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=1a9688aa13814443b3041837565eb8bf") else {
            fatalError("URL is not correct!")
        }
        
        Webservice().loadTopHeadlines(url: url) { articles in
            if let articles = articles {
                self.articles = articles.map(ArticleViewModel.init)
            }
            
        }
        
    }
    
}
