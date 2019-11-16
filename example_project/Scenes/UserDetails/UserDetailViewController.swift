//
//  UserDetailViewController.swift
//  example_project
//
//  Created by magdalena.skawinska on 16/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit

protocol UserDetailViewControllerOutput {
    func handleViewDidLoad()
}

final class UserDetailViewController: UIViewController {

    var output: UserDetailViewControllerOutput!
    var router: UserDetailRouterProtocol!

    fileprivate let currentView = Bundle.nibView(for: UserDetailView.self)

    // MARK: - Init

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        UserDetailConfigurator.sharedInstance.configure(viewController: self)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UserDetailConfigurator.sharedInstance.configure(viewController: self)
    }

    // MARK: - View lifecycle

    override func loadView() {
        view = currentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.handleViewDidLoad()
    }
}

// MARK: - UserDetailPresenterOutput

extension UserDetailViewController: UserDetailPresenterOutput {
    func displayUser(userDTO: UserDTO) {
        currentView?.configure(userDTO: userDTO)
    }
}
