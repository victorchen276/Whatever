////
////  DataService.swift
////  Whatever
////
////  Created by Chen Yue on 9/08/20.
////  Copyright © 2020 Mt. Zendo. All rights reserved.
////
//
import Foundation
import Alamofire

struct DataService {
    
    // MARK: - Singleton
    static let shared = DataService()
    
    // MARK: - URL
    private var photoUrl = "https://jsonplaceholder.typicode.com/photos"
    
    // MARK: - Services
    func requestFetchPhoto(with id: Int, completion: @escaping (Photo?, Error?) -> ()) {
        let url = "\(photoUrl)/\(id)"
		print(url)
		Alamofire.request(url).responsePhoto { response in
            if let error = response.error {
                completion(nil, error)
                return
            }
            if let photo = response.result.value {
                completion(photo, nil)
                return
            }
        }
	}
}
