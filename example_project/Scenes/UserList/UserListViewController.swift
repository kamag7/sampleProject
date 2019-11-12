//
//  UserListViewController.swift
//  example_project
//
//  Created by magdalena.skawinska on 12/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit

protocol UserListViewControllerOutput {}

final class UserListViewController: UIViewController {

    var output: UserListViewControllerOutput!
    var router: UserListRouterProtocol!

    fileprivate let currentView = Bundle.nibView(for: UserListView.self)

    // MARK: - Init

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        UserListConfigurator.sharedInstance.configure(viewController: self)
        self.title = "title"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UserListConfigurator.sharedInstance.configure(viewController: self)

    }

    // MARK: - View lifecycle

    override func loadView() {
        view = currentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        currentView?.configure(items: UserListWorker().getUsers())
    }
}

// MARK: - UserListPresenterOutput

extension UserListViewController: UserListPresenterOutput {}
