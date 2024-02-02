//
//  UnsplashTopic.swift
//  Unsplash
//
//  Created by HUMBLOT Stéphane on 02/02/2024.
//

import Foundation

struct UnsplashTopic: Codable, Identifiable {
    let id: String
    let title: String
    let link: UnsplashTopicUrls
    let cover: UnsplashCoverPhoto
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case link = "links"
        case cover = "cover_photo"
    }
}

struct UnsplashCoverPhoto: Codable {
    let color: String
    let urls: UnsplashCoverPhotoUrls
}

struct UnsplashCoverPhotoUrls: Codable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}

struct UnsplashTopicUrls: Codable {
    let photos: String
}
