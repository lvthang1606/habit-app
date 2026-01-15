//
//  AppConfig.swift
//  HabitApp
//
//  Created by Thang Le on 14/1/26.
//

import Foundation

enum AppConfig {
    static let supabaseURL: URL = {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let urlString = dict["SUPABASE_URL"] as? String,
              let url = URL(string: urlString)
        else {
            fatalError("Missing SUPABASE_URL in Config.plist")
        }
        return url
    }()
    
    static let publishableKey: String = {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let key = dict["SUPABASE_PUBLISHABLE_KEY"] as? String
        else {
            fatalError("Missing SUPABASE_URL in Config.plist")
        }
        return key
    }()
}
