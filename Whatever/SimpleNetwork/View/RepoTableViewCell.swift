//
//  RepoTableViewCell.swift
//  Whatever
//
//  Created by Chen Yue on 19/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

	@IBOutlet var repoTitleLabel: UILabel!
	@IBOutlet var descLabel: UILabel!
	@IBOutlet var starCountLabel: UILabel!
	@IBOutlet var languageLabel: UILabel!
	
	public var viewModel: RepoTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            repoTitleLabel.text = viewModel.name
            descLabel.text = viewModel.desc
            languageLabel.text = viewModel.language
            starCountLabel.text = viewModel.starsCount
        }
    }
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
