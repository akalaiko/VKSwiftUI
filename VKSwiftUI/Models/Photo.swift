//
//  Photo.swift
//  VKSwiftUI
//
//  Created by Tim on 27.06.2022.
//

import Foundation
//import UIKit

struct Photos: Codable {
    let sizes: [Photo]
//    let likes: Likes?
    let ownerID: Int
    
    enum CodingKeys: String, CodingKey {
        case sizes
//        case likes
        case ownerID = "owner_id"
    }
}

struct Photo: Codable {
    let type: String?
    let url: String

    init(url: String) { // internal - внутри исходного модуля
        self.type = nil
        self.url = url
    }
//    var aspectRatio: CGFloat { return CGFloat(height ?? 1)/CGFloat(width ?? 1) }
}
