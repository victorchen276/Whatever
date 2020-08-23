//
//  AlamofireViewController.swift
//  Whatever
//
//  Created by Chen Yue on 8/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class AlamofireViewController: UIViewController {

	@IBOutlet var headerImageView: UIImageView!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var subtitleLabel: UILabel!
	
	// MARK: - Injection
    let viewModel = PhotoViewModel(dataService: DataService())
	
	override func viewDidLoad() {
        super.viewDidLoad()
		title = "MVVM with Alamofire"
		
		attemptFetchPhoto(withId: 8)
    }
	
	// MARK: - Networking
    private func attemptFetchPhoto(withId id: Int) {
        viewModel.fetchPhoto(withId: id)
        
        viewModel.updateLoadingStatus = {
            let _ = self.viewModel.isLoading ? self.activityIndicatorStart() : self.activityIndicatorStop()
        }
        
        viewModel.showAlertClosure = {
            if let error = self.viewModel.error {
                print(error.localizedDescription)
            }
        }
        
        viewModel.didFinishFetch = {
            self.titleLabel.text = self.viewModel.titleString
            self.subtitleLabel.text = self.viewModel.albumIdString
            self.headerImageView.sd_setImage(with: self.viewModel.photoUrl, completed: nil)
        }
    }
    
    // MARK: - UI Setup
    private func activityIndicatorStart() {
        // Code for show activity indicator view
        // ...
        print("start")
    }
    
    private func activityIndicatorStop() {
        // Code for stop activity indicator view
        // ...
        print("stop")
    }
	
}
