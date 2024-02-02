//
//  UnsplashTopicView.swift
//  Unsplash
//
//  Created by HUMBLOT Stéphane on 02/02/2024.
//

import SwiftUI

struct UnsplashTopicView: View {
    
    @State var topic: UnsplashTopic
    
    var body: some View {
        Text(topic.title)
    }
}
