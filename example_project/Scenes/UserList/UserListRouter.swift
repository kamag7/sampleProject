//
//  UserListRouter.swift
//  example_project
//
//  Created by magdalena.skawinska on 12/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit

protocol UserListRouterProtocol {
    var viewController: UserListViewController? { get }
    var dataSource: UserListDataSource? { get }
}

final class UserListRouter {

    weak var viewController: UserListViewController?
    weak var dataSource: UserListDataSource?

    // MARK: - Init

    init(viewController: UserListViewController?, dataSource: UserListDataSource) {
        self.viewController = viewController
        self.dataSource = dataSource
    }
}

// MARK: - UserListRouterProtocol

extension UserListRouter: UserListRouterProtocol {}
