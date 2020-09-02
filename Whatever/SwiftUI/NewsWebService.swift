//
//  ApiWebService.swift
//  Whatever
//
//  Created by Chen Yue on 2/09/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import Foundation

class Webservice {
    
    func loadTopHeadlines(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let response = try? JSONDecoder().decode(NewsResponse.self, from: data)
            if let response = response {
                DispatchQueue.main.async {
                    completion(response.articles)
                }
            }
            
            
        }.resume()
        
    }
    
}
