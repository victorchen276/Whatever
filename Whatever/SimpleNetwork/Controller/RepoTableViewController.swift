//
//  RepoTableViewController.swift
//  Whatever
//
//  Created by Chen Yue on 19/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import UIKit

class RepoTableViewController: UIViewController {

	@IBOutlet var tableView: UITableView!
	
	private let viewModel = RepoTableViewModel()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
		viewModel.getMostPopularRepos(language: "Swift") { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}

extension RepoTableViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.generateTableViewCell(with: "Cell") as! RepoTableViewCell
		let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
		cell.viewModel = cellViewModel
		return cell
	}
	
}

extension RepoTableViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let ctl = UserViewController.init(nibName: "UserViewController", bundle: nil)
		ctl.userLogin = viewModel.selectedUserLogin(index: indexPath.row)
		self.navigationController?.pushViewController(ctl, animated: true)
	}
	
}
