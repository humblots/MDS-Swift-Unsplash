//
//  PListManager.swift
//  Unsplash
//
//  Created by HUMBLOT Stéphane on 02/02/2024.
//

import Foundation

struct ConfigData: Codable {
    let clientId: String
    
    enum CodingKeys: String, CodingKey {
        case clientId = "client_id"
    }
}

class ConfigurationManager {
    
    static var instance = ConfigurationManager()
    
    internal let plistDictionnary: ConfigData
    
    init() {
        let url = Bundle.main.url(forResource: "environment", withExtension:"plist")!
            do {
                let data = try Data(contentsOf: url)
                let result = try PropertyListDecoder().decode(ConfigData.self, from: data)
                self.plistDictionnary = result
            } catch { fatalError("Could not boot app without configuration plist") }
    }
}
