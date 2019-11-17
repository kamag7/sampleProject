//
//  UsersApi.swift
//  example_project
//
//  Created by magdalena.skawinska on 16/11/2019.
//  Copyright © 2019 magdalena.skawinska. All rights reserved.
//

import Foundation
import Alamofire

class UsersApi {
    func getUsers() -> [UserDTO] {
        return getUsersFromDailyMotion() + getUsersFromGitHub()
    }
}

private extension UsersApi {
    func getUsersFromDailyMotion() -> [UserDTO] {
        //https://api.dailymotion.com/users?fields=avatar_360_url,username
        AF.request("https://api.dailymotion.com/users", method: .get, parameters: ["fields":["avatar_360_url","username"]])
            .responseJSON { response in
                if let JSON = response.data {
                      print("JSON: \(JSON)")
                      let list = try? JSONDecoder().decode(ListDTO.self, from: JSON)
                    print("users: \(list?.users)")
                  }
        }
        return []
    }

    func getUsersFromGitHub() -> [UserDTO] {
        //https://api.github.com/users
        AF.request("https://api.github.com/users", method: .get)
               .responseJSON { response in
                if let JSON = response.data {
                    print("JSON: \(JSON)")
                    let users = try? JSONDecoder().decode([GHUserDTO].self, from: JSON)
                    //print("users: \(users)")
                }
               }
        return []
    }
}

enum ParserError: Error {
    case noData
    case parsingError
}
