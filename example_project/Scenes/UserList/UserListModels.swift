//
//  UserListModels.swift
//  example_project
//
//  Created by magdalena.skawinska on 12/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit

struct UserListModels {
    struct GetData {

        struct Request {}

        struct Response {
            let users: [UserDTO]
        }
        
        struct ViewModel {
            let users: [UserDTO]
        }
    }
}
