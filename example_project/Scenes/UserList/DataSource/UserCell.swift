//
//  UserCell.swift
//  example_project
//
//  Created by magdalena.skawinska on 12/11/2019.
//  Copyright © 2019 magdalena.skawinska. All rights reserved.
//

import Foundation
import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!

    func configureView(image: UIImage? = nil, name: String) {
        nameLabel.text = name
        guard let imageR = image else { return }
        avatarImageView.image = imageR
    }
}
