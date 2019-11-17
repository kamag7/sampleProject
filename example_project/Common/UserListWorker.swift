//
//  UserListWorker.swift
//  example_project
//
//  Created by magdalena.skawinska on 12/11/2019.
//  Copyright © 2019 magdalena.skawinska. All rights reserved.
//

import Foundation
import Hydra

class UserListWorker {
    func getMockUsers() -> [UserDTO]{
        var  users: [UserDTO] = []

        let user0 = UserDTO(name: "Adam", sourceApi: .daliyMotion)
        users.append(user0)

        let user1 = UserDTO(name: "Ewa", sourceApi: .daliyMotion)
        users.append(user1)

        let user2 = UserDTO(name: "Ola", sourceApi: .gitHub)
        users.append(user2)

        let user3 = UserDTO(name: "Kasia", sourceApi: .gitHub)
        users.append(user3)
        return users
    }

    func getUsers() -> [UserDTO] {
        return getMockUsers()
    }

    func getUsersFromSerwises() -> Promise<[UserDTO]> {
        UsersApi().getUsers()
    }
}
