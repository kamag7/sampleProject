//
//  UserListPresenter.swift
//  example_project
//
//  Created by magdalena.skawinska on 12/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit

protocol UserListPresenterOutput: class {}

class UserListPresenter {

    private(set) weak var output: UserListPresenterOutput?

    // MARK: - Init

    init(output: UserListPresenterOutput) {
        self.output = output
    }
}

// MARK: - UserListInteractorOutput

extension UserListPresenter: UserListInteractorOutput {}
