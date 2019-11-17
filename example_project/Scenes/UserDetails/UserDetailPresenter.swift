//
//  UserDetailPresenter.swift
//  example_project
//
//  Created by magdalena.skawinska on 16/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit

protocol UserDetailPresenterOutput: class {
    func displayUser(userDTO: UserDTO)
}

class UserDetailPresenter {

    private(set) weak var output: UserDetailPresenterOutput?

    // MARK: - Init

    init(output: UserDetailPresenterOutput) {
        self.output = output
    }
}

// MARK: - UserDetailInteractorOutput

extension UserDetailPresenter: UserDetailInteractorOutput {
    func presentUser(userDTO: UserDTO) {
        DispatchQueue.main.async {
            self.output?.displayUser(userDTO: userDTO)
        }
    }
}
