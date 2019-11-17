//
//  UsersApi.swift
//  example_project
//
//  Created by magdalena.skawinska on 16/11/2019.
//  Copyright © 2019 magdalena.skawinska. All rights reserved.
//

import Foundation
import Alamofire
import Hydra

class UsersApi {

    func getUsers() -> Promise<[UserDTO]> {
        return async({ _ in
            var users: [UserDTO] = []
            let usersFromGtiHub = try await(self.getUsersFromGitHub())
            let usersFromDailyMotion = try await(self.getUsersFromDailyMotion())
            users.append(contentsOf: usersFromGtiHub)
            users.append(contentsOf: usersFromDailyMotion)
            return users
        })
    }
}

private extension UsersApi {
    func getUsersFromDailyMotion() -> Promise<[UserDTO]> {
        return Promise { resolved, rejected, _ in
        //https://api.dailymotion.com/users?fields=avatar_360_url,username
         AF.request("https://api.dailymotion.com/users", method: .get, parameters: ["fields":["avatar_360_url","username"]])
            .responseJSON { response in
                if let JSON = response.data {
                    let list = try? JSONDecoder().decode(ListDTO.self, from: JSON)
                    print("fetched users: \(String(describing: list?.users))")
                    resolved(list?.users ?? [])
                }
                rejected(ParserError.noData)
        }
        }
    }

    func getUsersFromGitHub() -> Promise<[UserDTO]> {
        return Promise { resolved, rejected, _ in
            //https://api.github.com/users
            AF.request("https://api.github.com/users", method: .get)
                .responseJSON { response in
                    if let JSON = response.data {
                        print("JSON: \(JSON)")
                        let users = try? JSONDecoder().decode([GHUserDTO].self, from: JSON)
                        print("users: \(String(describing: users))")
                        resolved(users ?? [])
                    }
                    rejected(ParserError.noData)
            }
        }
    }
}

enum ParserError: Error {
    case noData
    case parsingError
}
