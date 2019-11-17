//
//  UserListViewController.swift
//  example_project
//
//  Created by magdalena.skawinska on 12/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit

protocol UserListViewControllerOutput {
    func handlerViewDidLoad()
}

final class UserListViewController: UIViewController {

    var output: UserListViewControllerOutput!
    var router: UserListRouterProtocol!

    fileprivate let currentView = Bundle.nibView(for: UserListView.self)

    // MARK: - Init

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        UserListConfigurator.sharedInstance.configure(viewController: self)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UserListConfigurator.sharedInstance.configure(viewController: self)

    }

    // MARK: - View lifecycle

    override func loadView() {
        view = currentView
        currentView?.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.handlerViewDidLoad()
        self.title = "User list"
    }
}

// MARK: - UserListPresenterOutput

extension UserListViewController: UserListPresenterOutput {
    func displayUsers(users: [UserDTO]) {
        currentView?.configure(items: users)
    }
}

extension UserListViewController: UserListViewDelegate {
    func userListView(userListView: UserListView, didTapItemAt index: Int) {
        router?.navigateToUserDetails(with: UserListWorker().getUsers()[index] )
    }
}
