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
    func navigateToUser(user: UserDTO)
}

protocol UserListDataSource: class {
    var users: [UserDTO] { get set }
}

class UserListInteractor: UserListDataSource {
    var users: [UserDTO] = []
    let output: UserListInteractorOutput

    // MARK: - Init

    init(output: UserListInteractorOutput) {
        self.output = output
    }
}

// MARK: - UserListViewControllerOutput

extension UserListInteractor: UserListViewControllerOutput {
    func navigateToUserDetails(idx: Int) {
        output.navigateToUser(user: users[idx])
    }

    func handlerViewDidLoad() {
        UserListWorker().getUsersFromSerwises().then { users in
            self.users = users
            self.output.present(users: users)
        }
    }
}
