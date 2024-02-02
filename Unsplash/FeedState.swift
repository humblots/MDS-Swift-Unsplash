//
//  FeedState.swift
//  Unsplash
//
//  Created by HUMBLOT Stéphane on 02/02/2024.
//

import Foundation

class FeedState: ObservableObject {
    
    @Published var homeFeed: [UnsplashPhoto]?
    @Published var topics: [UnsplashTopic]?

    func fetchHomeFeed() async {
        if let url = feedUrl() {
            do {
                let request = URLRequest(url: url)
                let (data, _) = try await URLSession.shared.data(for: request)
                let deserializedData = try JSONDecoder().decode([UnsplashPhoto].self, from: data)
                homeFeed = deserializedData
                return
            } catch {
                print("Error: \(error)")
            }
        }
        
        homeFeed = nil
    }
    
    
    func fetchTopics() async {
        if let url = topicsUrl() {
            do {
                let request = URLRequest(url: url)
                let (data, _) = try await URLSession.shared.data(for: request)
                let deserializedData = try JSONDecoder().decode([UnsplashTopic].self, from: data)
                topics = deserializedData
                return
            } catch {
                print("Error: \(error)")
            }
        }
        
        topics = nil
    }
}
