//
//  Group.swift
//  VKSwiftUI
//
//  Created by Tim on 27.06.2022.
//

import Foundation

struct Group:Identifiable {
    let id: Int
    let name: String
    let avatar: String
}

extension Group: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatar = "photo_100"
    }
}
