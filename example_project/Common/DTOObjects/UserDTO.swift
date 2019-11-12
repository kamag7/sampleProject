//
//  UserDTO.swift
//  example_project
//
//  Created by magdalena.skawinska on 12/11/2019.
//  Copyright © 2019 magdalena.skawinska. All rights reserved.
//

import Foundation
import UIKit

enum SourceApi {
    case daliyMotion
    case gitHub
}

class UserDTO {
    var name: String = ""
    var image: UIImage? = nil
    var sourceApi: SourceApi

    init(name: String, image: UIImage? = nil, sourceApi: SourceApi) {
        self.name = name
        self.image = image
        self.sourceApi = sourceApi
    }
}
