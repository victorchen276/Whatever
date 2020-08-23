//
//  PhotoViewModel.swift
//  Whatever
//
//  Created by Chen Yue on 9/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import Foundation
import Alamofire

class PhotoViewModel {
    
    // MARK: - Properties
    private var photo: Photo? {
        didSet {
            guard let p = photo else { return }
            self.setupText(with: p)
            self.didFinishFetch?()
        }
    }
    var error: Error? {
        didSet { self.showAlertClosure?() }
    }
    var isLoading: Bool = false {
        didSet { self.updateLoadingStatus?() }
    }
    
    var titleString: String?
    var albumIdString: String?
    var photoUrl: URL?
    
    private var dataService: DataService?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    // MARK: - Network call
    func fetchPhoto(withId id: Int) {
        self.dataService?.requestFetchPhoto(with: id, completion: { (photo, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.error = nil
            self.isLoading = false
            self.photo = photo
        })
    }
    
    // MARK: - UI Logic
    private func setupText(with photo: Photo) {
        if let title = photo.title, let albumId = photo.albumID, let urlString = photo.url {
            self.titleString = "Title: \(title)"
            self.albumIdString = "Album ID for this photo : \(albumId)"
            
            // formatting url from http to https
            guard let formattedUrlString = String.replaceHttpToHttps(with: urlString), let url = URL(string: formattedUrlString) else {
                return
            }
            self.photoUrl = url
        }
    }
    
}
