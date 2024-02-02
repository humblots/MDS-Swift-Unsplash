//
//  UnsplashPhoto.swift
//  Unsplash
//
//  Created by HUMBLOT Stéphane on 02/02/2024.
//

import SwiftUI

struct UnsplashPhoto: Codable, Identifiable {
    let id: String
    let slug: String
    let author: User
    let url: UnsplashImageUrls
    
    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case author = "user"
        case url
    }
}

struct User: Codable {
    let name: String
}

struct UnsplashImageUrls: Codable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}
