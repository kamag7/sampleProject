//
//  DMUserDTO.swift
//  example_project
//
//  Created by magdalena.skawinska on 17/11/2019.
//  Copyright © 2019 magdalena.skawinska. All rights reserved.
//

import Foundation

class ListDTO: Codable {
    var users: [DMUserDTO]

    // MARK: - Codable

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        users = try container.decode([DMUserDTO].self, forKey: .users)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(users, forKey: .users)
    }


    private enum CodingKeys: String, CodingKey {
        case users = "list"
        //case imageString = "avatar_360_url"
    }

}

class DMUserDTO: Codable {
    var name: String = ""
    var imageString: String? = ""
    var sourceApi: SourceApi = .gitHub

// MARK: - Codable

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        imageString = try container.decodeIfPresent(String.self, forKey: .imageString)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(imageString, forKey: .imageString)
    }


    private enum CodingKeys: String, CodingKey {
        case name = "username"
        case imageString = "avatar_360_url"
    }
}
