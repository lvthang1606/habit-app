//
//  Habit.swift
//  HabitApp
//
//  Created by Thang Le on 25/11/25.
//

import Foundation

struct Habit: Identifiable {
    let id = UUID()
    let title: String
    let isCompleted: Bool
}
