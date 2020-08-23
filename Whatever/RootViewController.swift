//
//  ViewController.swift
//  Whatever
//
//  Created by Chen Yue on 8/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

	let types = ["Networking", "SwiftUI"]
//		["MVVM with Alamofire", "Simple Networking", "MVVM SwiftUI"]
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Whatever!"
	}

}

extension RootViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return types.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: UITableViewCell = {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
				return UITableViewCell(style: .default, reuseIdentifier: "cell")
			}
			return cell
		}()
		
		cell.textLabel?.text = types[indexPath.row]
		
		return cell
	}
	
}

extension RootViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		switch indexPath.row {
		case 0:
			let ctl = AlamofireViewController.init(nibName: "AlamofireViewController", bundle: nil)
			self.navigationController?.pushViewController(ctl, animated: true)
		case 1:
			let ctl = RepoTableViewController.init(nibName: "RepoTableViewController", bundle: nil)
			self.navigationController?.pushViewController(ctl, animated: true)
		default:
			break
		} 
	}
	
}
