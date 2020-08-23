//
//  NetworkViewController.swift
//  Whatever
//
//  Created by Chen Yue on 24/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import UIKit

class NetworkViewController: UIViewController {

	let types = ["MVVM Alamofire", "Simple Network"]
    override func viewDidLoad() {
        super.viewDidLoad()
		title = "Networking"
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

extension NetworkViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return types.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		let cell: UITableViewCell = {
//			guard let cell = tableView.dequeueReusableCell(withIdentifier: "NetworkCell") else {
//				return UITableViewCell(style: .default, reuseIdentifier: "NetworkCell")
//			}
//			return cell
//		}()
		let cell = tableView.generateTableViewCell(with: "Cell")
		cell.textLabel?.text = types[indexPath.row]

		return cell
	}
	
}

extension NetworkViewController: UITableViewDelegate {
	
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

