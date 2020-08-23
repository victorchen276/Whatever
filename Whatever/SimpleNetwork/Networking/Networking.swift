//
//  Networking.swift
//  Whatever
//
//  Created by Chen Yue on 19/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import Foundation


struct Networking {

    func performNetworkTask<T: Codable>(endpoint: GitHubAPI,
                                        type: T.Type,
                                        completion: ((_ response: T) -> Void)?) {
		//TODO: call completion when it is failed
		guard let url = URL(string: endpoint.baseURL.absoluteString + endpoint.path) else { return }
		let urlRequest = URLRequest(url: url)
        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let _ = error {
                return
            }
            guard let data = data else {
                return
            }
            let response = Response(data: data)
            guard let decoded = response.decode(type) else {
                return
            }
            completion?(decoded)
        }

        urlSession.resume()
    }

}
