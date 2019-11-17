//
//  UserDetailView.swift
//  example_project
//
//  Created by magdalena.skawinska on 16/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit
import Kingfisher

class UserDetailView: UIView {
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var kindAPILabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!

    func configure(userDTO: UserDTO) {
        nameUserLabel.text = userDTO.name
        kindAPILabel.text = getTextLabelToSourceApi(sourceApi: userDTO.sourceApi)
        let url = URL(string:userDTO.imageStringUrl ?? "")
        avatarImageView.kf.setImage(with: url)
    }

    func getTextLabelToSourceApi(sourceApi: SourceApi) -> String {
        switch sourceApi {
        case .daliyMotion:
            return "data comes from daily motion"
        case .gitHub:
            return "data comes from gitHub"
        }
    }
}
