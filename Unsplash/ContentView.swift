//
//  ContentView.swift
//  Unsplash
//
//  Created by HUMBLOT Stéphane on 02/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var feedState = FeedState()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Button(action: {
                    Task {
                        await feedState.fetchHomeFeed()
                        await feedState.fetchTopics()
                    }
                }, label: {
                    Text("Load Data")
                })
                
                ScrollView(.horizontal) {
                    HStack {
                        if let topics = feedState.topics {
                            ForEach(topics, id: \.id) { topic in
                                NavigationLink {
                                    UnsplashTopicView(topic: topic)
                                } label: {
                                    VStack {
                                        AsyncImage(url: URL(string: topic.cover.urls.small))
                                        {
                                            image in
                                            image.resizable()
                                                .frame(width: 150, height: 50)
                                                .cornerRadius(12)
                                        } placeholder: {
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color(hex: topic.cover.color))
                                                .frame(width: 150, height: 50)
                                        }
                                        Text(topic.title)
                                    }
                                    .padding([.bottom], 10)
                                }
                            }
                        } else {
                            ForEach(0..<3) { _ in
                                VStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.gray)
                                        .frame(width: 150, height: 50)
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.gray)
                                        .frame(height: 10)
                                        .padding([.leading, .trailing], 15)
                                }
                                .padding([.bottom], 20)
                            }
                        }
                    }
                }
                .padding()
                
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(minimum: 150), spacing: 8),
                        GridItem(.flexible(minimum: 150), spacing: 8)
                    ]) {
                        if let feed = feedState.homeFeed {
                            ForEach(feed, id: \.id) { unsplashPhoto in
                                AsyncImage(url: URL(string: unsplashPhoto.urls.regular)){
                                    image in
                                    image.resizable()
                                        .frame(height: 150)
                                        .cornerRadius(12)
                                } placeholder: {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(hex: unsplashPhoto.color))
                                        .frame(height: 150)
                                }
                            }
                        } else {
                            ForEach(0 ..< 12) { _ in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.gray)
                                    .frame(height: 150)
                            }
                        }
                    }
                }
                .cornerRadius(12)
            }
            .padding()
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.large)
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
