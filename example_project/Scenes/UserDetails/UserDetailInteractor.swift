//
//  UserDetailInteractor.swift
//  example_project
//
//  Created by magdalena.skawinska on 16/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit

protocol UserDetailInteractorOutput {
    func presentUser(userDTO: UserDTO)
}

protocol UserDetailDataSource: class {
    var userDTO: UserDTO? { get set }
}

class UserDetailInteractor: UserDetailDataSource {
    var userDTO: UserDTO?
    let output: UserDetailInteractorOutput

    // MARK: - Init

    init(output: UserDetailInteractorOutput) {
        self.output = output
    }
}

// MARK: - UserDetailViewControllerOutput

extension UserDetailInteractor: UserDetailViewControllerOutput {
    func handleViewDidLoad() {
        guard let userDTO = userDTO else { return }
        output.presentUser(userDTO: userDTO)
    }
}
