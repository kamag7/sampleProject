//
//  UserListConfigurator.swift
//  example_project
//
//  Created by magdalena.skawinska on 12/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit

class UserListConfigurator {

    // MARK: - Singleton

    static let sharedInstance: UserListConfigurator = UserListConfigurator()

    // MARK: - Configuration

    func configure(viewController: UserListViewController) {

        let presenter = UserListPresenter(output: viewController)
        let interactor = UserListInteractor(output: presenter)
        let router = UserListRouter(viewController: viewController, dataSource: interactor)

        viewController.output = interactor
        viewController.router = router
    }
}
