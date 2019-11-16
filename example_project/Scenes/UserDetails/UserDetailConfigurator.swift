//
//  UserDetailConfigurator.swift
//  example_project
//
//  Created by magdalena.skawinska on 16/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit

class UserDetailConfigurator {

    // MARK: - Singleton

    static let sharedInstance: UserDetailConfigurator = UserDetailConfigurator()

    // MARK: - Configuration

    func configure(viewController: UserDetailViewController) {

        let presenter = UserDetailPresenter(output: viewController)
        let interactor = UserDetailInteractor(output: presenter)
        let router = UserDetailRouter(viewController: viewController, dataSource: interactor)

        viewController.output = interactor
        viewController.router = router
    }
}
