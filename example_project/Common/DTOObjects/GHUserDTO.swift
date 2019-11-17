//
//  GHUserDTO.swift
//  example_project
//
//  Created by magdalena.skawinska on 16/11/2019.
//  Copyright © 2019 magdalena.skawinska. All rights reserved.
//

import Foundation

class GHUserDTO: Codable {
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
        case name = "login"
        case imageString = "avatar_url"
    }
}
