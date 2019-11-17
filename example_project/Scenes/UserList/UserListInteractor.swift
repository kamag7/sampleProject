//
//  UserListInteractor.swift
//  example_project
//
//  Created by magdalena.skawinska on 12/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit
import Hydra

protocol UserListInteractorOutput {
    func present(users: [UserDTO])
}

protocol UserListDataSource: class {}

class UserListInteractor: UserListDataSource {

    let output: UserListInteractorOutput

    // MARK: - Init

    init(output: UserListInteractorOutput) {
        self.output = output
    }
}

// MARK: - UserListViewControllerOutput

extension UserListInteractor: UserListViewControllerOutput {
    func handlerViewDidLoad() {
        UserListWorker().getUsersFromSerwises().then { users in
            self.output.present(users: users)
        }
    }
}
