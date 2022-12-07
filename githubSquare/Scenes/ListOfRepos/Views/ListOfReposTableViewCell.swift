//
//  ListOfReposTableViewCell.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//

import UIKit

class ListOfReposTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func fill(name: String, description: String) {
        titleLabel.text = name
        descriptionLabel.text = description
    }
}
