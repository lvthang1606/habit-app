//
//  HabitRow.swift
//  HabitApp
//
//  Created by Thang Le on 10/12/25.
//

import SwiftUI

struct HabitRow: View {
    var habit: Habit
    
    var body: some View {
        HStack {
            Text(habit.title)
                .foregroundStyle(Color.purple)
            Spacer()
            Checkbox(isDone: habit.isCompleted)
        }
    }
}

struct Checkbox: View {
    var isDone: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.purple.opacity(isDone ? 0.8 : 0.4))
                .frame(width: 28, height: 28)
            if isDone {
                Image(systemName: "checkmark")
                    .foregroundStyle(.white)
                    .font(.system(size: 14, weight: .bold))
            }
        }
    }
}
