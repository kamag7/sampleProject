//
//  UserDetailRouter.swift
//  example_project
//
//  Created by magdalena.skawinska on 16/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit

protocol UserDetailRouterProtocol {
    var viewController: UserDetailViewController? { get }
    var dataSource: UserDetailDataSource? { get }
}

final class UserDetailRouter {

    weak var viewController: UserDetailViewController?
    weak var dataSource: UserDetailDataSource?

    // MARK: - Init

    init(viewController: UserDetailViewController?, dataSource: UserDetailDataSource) {
        self.viewController = viewController
        self.dataSource = dataSource
    }
}

// MARK: - UserDetailRouterProtocol

extension UserDetailRouter: UserDetailRouterProtocol {}
