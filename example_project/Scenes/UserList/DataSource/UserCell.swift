//
//  UserCell.swift
//  example_project
//
//  Created by magdalena.skawinska on 12/11/2019.
//  Copyright © 2019 magdalena.skawinska. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class UserCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!

    func configureView(imageStringUrl: String, name: String) {
        nameLabel.text = name
        let url = URL(string: imageStringUrl)
        avatarImageView.kf.setImage(with: url)
    }
}
