//
//  HabitList.swift
//  HabitApp
//
//  Created by Thang Le on 24/11/25.
//

import SwiftUI

// MARK: - Models
struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}

// MARK: - Main View
struct HabitList: View {
    @State private var tasks = [
        Task(title: "Read 10 pages of a book", isCompleted: true),
        Task(title: "Meditated for 5 minutes", isCompleted: true),
        Task(title: "Had fruit for breakfast", isCompleted: false),
        Task(title: "Had a healthy lunch", isCompleted: false),
        Task(title: "Went for a run", isCompleted: false),
        Task(title: "Went to bed before 10PM", isCompleted: false)
    ]
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeTabView(tasks: $tasks)
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .tag(0)
            
            AddHabitView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                }
                .tag(1)
            
            Text("Stats View")
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                }
                .tag(2)
        }
        .accentColor(AppColors.navigationIcon)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.black
            
            // Remove labels and customize icon colors
            let itemAppearance = UITabBarItemAppearance()
            itemAppearance.normal.iconColor = UIColor(AppColors.navigationIcon)
            itemAppearance.selected.iconColor = UIColor(AppColors.navigationIcon)
            
            // Hide titles
            itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
            itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.clear]
            
            appearance.stackedLayoutAppearance = itemAppearance
            appearance.inlineLayoutAppearance = itemAppearance
            appearance.compactInlineLayoutAppearance = itemAppearance
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
            
            // Increase tab bar height
            UITabBar.appearance().frame.size.height = 80
        }
    }
}

// MARK: - Home Tab View
struct HomeTabView: View {
    @Binding var tasks: [Task]
    
    var body: some View {
        ZStack {
            AppColors.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                HeaderView()
                TaskListView(tasks: $tasks)
            }
        }
    }
}

// MARK: - Header View
struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    LinearGradient(
                        colors: [AppColors.headerGradientStart, AppColors.headerGradientEnd],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 90)
            
            HStack {
                Text("Monday, August 2")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                
                Spacer()
                
                ProfileButton()
            }
            .padding(.horizontal, 30)
        }
        .padding(.horizontal, 20)
        .padding(.top, 50)
    }
}

// MARK: - Profile Button
struct ProfileButton: View {
    var body: some View {
        Circle()
            .fill(AppColors.profileBackground)
            .frame(width: 40, height: 40)
            .overlay(
                Image(systemName: "person.fill")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
            )
    }
}

// MARK: - Task List View
struct TaskListView: View {
    @Binding var tasks: [Task]
    
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(cornerRadii: .init(
                topLeading: 25,
                bottomLeading: 0,
                bottomTrailing: 0,
                topTrailing: 25
            ))
            .fill(AppColors.contentBackground)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Today, I have:")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.top, 35)
                    .padding(.bottom, 25)
                
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach($tasks) { $task in
                            TaskRow(task: $task)
                        }
                        
                        AddTaskButton()
                    }
                }
            }
        }
        .padding(.top, 20)
    }
}

// MARK: - Task Row
struct TaskRow: View {
    @Binding var task: Task
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                task.isCompleted.toggle()
            }
        }) {
            HStack {
                Text(task.title)
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                
                Spacer()
                
                CheckboxView(isCompleted: task.isCompleted)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
        }
    }
}

// MARK: - Checkbox View
struct CheckboxView: View {
    let isCompleted: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(isCompleted ? AppColors.checkboxCompleted : AppColors.checkboxUncompleted)
            .frame(width: 38, height: 38)
            .overlay(
                Image(systemName: "checkmark")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .opacity(isCompleted ? 1 : 0)
            )
    }
}

// MARK: - Add Task Button
struct AddTaskButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Text("Add new task")
                    .font(.system(size: 17))
                    .foregroundColor(AppColors.addTaskText)
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(AppColors.addTaskButton)
                    .frame(width: 38, height: 38)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                    )
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 18)
        }
    }
}

// MARK: - Bottom Navigation Bar
struct BottomNavigationBar: View {
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            NavigationButton(iconName: "house.fill")
            Spacer()
            NavigationButton(iconName: "plus.circle.fill")
            Spacer()
            NavigationButton(iconName: "chart.bar.fill")
            Spacer()
        }
        .frame(height: 80)
        .background(Color.black)
    }
}

// MARK: - Navigation Button
struct NavigationButton: View {
    let iconName: String
    
    var body: some View {
        Button(action: {}) {
            Image(systemName: iconName)
                .font(.system(size: 26))
                .foregroundColor(AppColors.navigationIcon)
        }
    }
}

// MARK: - App Colors
struct AppColors {
    static let background = Color(red: 0.15, green: 0.15, blue: 0.15)
    static let contentBackground = Color(red: 0.12, green: 0.12, blue: 0.12)
    static let headerGradientStart = Color(red: 0.47, green: 0.35, blue: 0.65)
    static let headerGradientEnd = Color(red: 0.42, green: 0.32, blue: 0.58)
    static let profileBackground = Color(red: 0.65, green: 0.25, blue: 0.35)
    static let checkboxCompleted = Color(red: 0.65, green: 0.6, blue: 0.85)
    static let checkboxUncompleted = Color(red: 0.45, green: 0.42, blue: 0.58)
    static let addTaskText = Color(red: 0.65, green: 0.6, blue: 0.75)
    static let addTaskButton = Color(red: 0.55, green: 0.5, blue: 0.7)
    static let navigationIcon = Color(red: 0.65, green: 0.6, blue: 0.75)
}

#Preview {
    HabitList()
}
