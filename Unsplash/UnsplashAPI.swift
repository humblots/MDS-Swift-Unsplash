//
//  UnsplashAPI.swift
//  Unsplash
//
//  Created by HUMBLOT Stéphane on 02/02/2024.
//

import Foundation
func unsplashApiBaseUrl() -> URLComponents {
    var urlComponent = URLComponents()
    urlComponent.scheme = "https"
    urlComponent.path = "api.unsplash.com"
    urlComponent.queryItems = [
        URLQueryItem(name: "client_id", value: ConfigurationManager.instance.plistDictionnary.clientId)
    ]
    
    return urlComponent
}

func feedUrl(orderBy: String = "popular", perPage: Int = 10) -> URL? {
    
   var urlComp = unsplashApiBaseUrl()
    urlComp.path += "/photos"
    
    if let baseUrl = urlComp.url {
        return URL(string: "\(baseUrl.absoluteString)&\(orderBy)&\(perPage)")
    } else {
        return nil
    }
}

func topicsUrl(orderBy: String = "featured", perPage: Int = 10) -> URL? {
    var urlComp = unsplashApiBaseUrl()
     urlComp.path += "/topics"
    
    if let baseUrl = urlComp.url {
        return URL(string: "\(baseUrl.absoluteString)&\(orderBy)&\(perPage)")
    } else {
        return nil
    }
}
