//
//  UserListView.swift
//  example_project
//
//  Created by magdalena.skawinska on 12/11/2019.
//  Copyright (c) 2019 magdalena.skawinska. All rights reserved.
//

import UIKit

protocol UserListViewDelegate: class {
    func userListView(userListView: UserListView, didTapItemAt index: Int)
}

class UserListView: UIView {

    @IBOutlet weak var tableView: UITableView!
    weak var delegate: UserListViewDelegate?
    var items: [UserDTO] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        configureTableView()
    }

    func configure(items: [UserDTO]) {
        self.items = items
    }

    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension UserListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = items[row].name
        cell.imageView?.image = #imageLiteral(resourceName: "no_image")

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.userListView(userListView: self, didTapItemAt: indexPath.row)
    }
}
