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
    func navigateToUserDetails(with userDTO: UserDTO?)
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

extension UserListRouter: UserListRouterProtocol {
    func navigateToUserDetails(with userDTO: UserDTO?) {
        let userDetailsViewContorller = UserDetailViewController()
        userDetailsViewContorller.router.dataSource?.userDTO = userDTO
        self.viewController?.navigationController?.pushViewController(userDetailsViewContorller, animated: true)
        }
}
