//
//  SupabaseManager.swift
//  HabitApp
//
//  Created by Thang Le on 14/1/26.
//

import Supabase

class SupabaseManager {
    static let shared = SupabaseManager()
    let client: SupabaseClient
    
    private init() {
        self.client = SupabaseClient(supabaseURL: AppConfig.supabaseURL,
                                     supabaseKey: AppConfig.publishableKey)
    }
}
