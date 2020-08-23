//
//  UserViewController.swift
//  Whatever
//
//  Created by Chen Yue on 19/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var loginLabel: UILabel!
	@IBOutlet weak var bioLabel: UILabel!
	
	private let viewModel = UserViewModel()

    public var userLogin: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		guard let login = userLogin else { return }
        viewModel.user(login: login) { [weak self] in
            if let url = self?.viewModel.imageURL {
                do {
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self?.imageView.image = image
                    }
                } catch _ { }
            }
            DispatchQueue.main.async {
                self?.nameLabel.text = self?.viewModel.name
                self?.loginLabel.text = self?.viewModel.username
                self?.bioLabel.text = self?.viewModel.bio
            }
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
