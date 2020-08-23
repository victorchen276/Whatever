//
//  UITableViewExtension.swift
//  Whatever
//
//  Created by Chen Yue on 20/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
	
	func generateTableViewCell(with identifier: String) -> UITableViewCell {
		guard let cell = self.dequeueReusableCell(withIdentifier: identifier) else {
			return UITableViewCell(style: .default, reuseIdentifier: identifier)
		}
		return cell
	}
	
}
