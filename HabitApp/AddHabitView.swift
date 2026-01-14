//
//  AddHabitView.swift
//  HabitApp
//
//  Created by Thang Le on 11/12/25.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @State private var habitName = "Play the guitar"
    @State private var selectedDays: Set<String> = ["W", "T", "F"]
    @State private var selectedTime = "Evening"
    
    var body: some View {
        ZStack {
            Color(red: 0.2, green: 0.2, blue: 0.2).ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(red: 0.47, green: 0.35, blue: 0.65))
                        .frame(height: 100)
                    
                    HStack {
                        Text("Add new habit")
                            .font(.system(size: 26, weight: .semibold))
                            .foregroundColor(.white)
                        Spacer()
                        Button(action: { dismiss() }) {
                            Circle()
                                .fill(.white)
                                .frame(width: 44, height: 44)
                                .overlay(Image(systemName: "xmark").font(.system(size: 20, weight: .semibold)).foregroundColor(Color(red: 0.47, green: 0.35, blue: 0.65)))
                        }
                    }
                    .padding(.horizontal, 30)
                }
                .padding(.horizontal, 10)
                .padding(.top, 50)
                
                // Content
                ZStack {
                    RoundedRectangle(cornerRadius: 25).fill(Color(red: 0.15, green: 0.15, blue: 0.15))
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 35) {
                            Text("Set up your habit\npreferences")
                                .font(.system(size: 28, weight: .semibold))
                                .foregroundColor(.white)
                                .lineSpacing(4)
                            
                            VStack(alignment: .leading, spacing: 15) {
                                TextField("", text: $habitName)
                                    .font(.system(size: 18))
                                    .foregroundColor(Color(red: 0.7, green: 0.65, blue: 0.85))
                                    .padding(.bottom, 8)
                                Rectangle().fill(Color(red: 0.35, green: 0.35, blue: 0.35)).frame(height: 1)
                            }
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Set periodicity")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                HStack(spacing: 15) {
                                    ForEach(["M", "T", "W", "T", "F", "S", "S"], id: \.self) { day in
                                        Button(action: {
                                            if selectedDays.contains(day) { selectedDays.remove(day) }
                                            else { selectedDays.insert(day) }
                                        }) {
                                            Circle()
                                                .strokeBorder(Color(red: 0.5, green: 0.45, blue: 0.65), lineWidth: 2)
                                                .background(Circle().fill(selectedDays.contains(day) ? Color(red: 0.55, green: 0.45, blue: 0.75) : Color.clear))
                                                .frame(width: 44, height: 44)
                                                .overlay(Text(day).font(.system(size: 16, weight: .semibold)).foregroundColor(.white))
                                        }
                                    }
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Text("When should we remind you?")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                HStack(spacing: 15) {
                                    ForEach(["Morning", "Noon", "Evening"], id: \.self) { time in
                                        Button(action: { selectedTime = time }) {
                                            VStack(spacing: 12) {
                                                Image(systemName: time == "Morning" ? "sun.max" : time == "Noon" ? "sun.and.horizon" : "moon")
                                                    .font(.system(size: 32))
                                                    .foregroundColor(selectedTime == time ? .white : Color(red: 0.6, green: 0.55, blue: 0.7))
                                                Text(time)
                                                    .font(.system(size: 16, weight: .medium))
                                                    .foregroundColor(selectedTime == time ? .white : Color(red: 0.6, green: 0.55, blue: 0.7))
                                            }
                                            .frame(maxWidth: .infinity, minHeight: 100)
                                            .background(
                                                RoundedRectangle(cornerRadius: 18)
                                                    .strokeBorder(Color(red: 0.4, green: 0.38, blue: 0.5), lineWidth: 2)
                                                    .background(RoundedRectangle(cornerRadius: 18).fill(selectedTime == time ? Color(red: 0.55, green: 0.45, blue: 0.75) : Color.clear))
                                            )
                                        }
                                    }
                                }
                            }
                            
                            Button(action: {}) {
                                Text("Add new habit")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, minHeight: 60)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color(red: 1.0, green: 0.45, blue: 0.45)))
                            }
                            .padding(.top, 20)
                        }
                        .padding(30)
                    }
                }
                .padding(.top, 20)
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    AddHabitView()
}


