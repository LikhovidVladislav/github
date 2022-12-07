//
//  DetailRepoTableViewCell.swift
//  githubSquare
//
//  Created by admin on 17.09.2022.
//

import UIKit

class DetailRepoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func fill(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
}
