//
//  Habit.swift
//  HabitApp
//
//  Created by Thang Le on 25/11/25.
//

import Foundation

struct Habit: Identifiable, Codable {
    let id: UUID
    let name: String
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case createdAt = "created_at"
    }
}
