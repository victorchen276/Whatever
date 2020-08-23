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
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Whatever!"
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

extension RootViewController: UITableViewDataSource {
	
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
		var cell: UITableViewCell
//			tableView.generateTableViewCell(with: "NetworkCell") as! RepoTableViewCell
		switch indexPath.row {
		case 0:
			cell = tableView.generateTableViewCell(with: "NetworkCell")
			cell.textLabel?.text = types[indexPath.row]
		case 1:
			cell = tableView.generateTableViewCell(with: "SwiftUICell")
			cell.textLabel?.text = types[indexPath.row]
		default:
			cell = tableView.generateTableViewCell(with: "Cell")
			break
		}
		cell.textLabel?.text = types[indexPath.row]
		return cell
	}
	
}

extension RootViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

	}
	
}
