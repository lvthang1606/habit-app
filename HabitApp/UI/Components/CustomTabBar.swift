//
//  CustomTabBar.swift
//  HabitApp
//
//  Created by Thang Le on 25/11/25.
//

import SwiftUI

struct CustomTabBar: View {
    init() {
        UITabBar.appearance().tintColor = .systemPurple
        
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .purple
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                TabView {
                    Text("Right now Screen")
                        .tabItem {
                            Image(systemName: "house.fill")
                        }
                    Text("Be active Screen")
                        .tabItem {
                            Image(systemName: "plus.circle.fill")		
                        }
                    Text("Confidence Screen")
                        .tabItem {
                            Image(systemName: "chart.bar.fill")
                        }
                    Text("Consistency Screen")
                        .tabItem {
                            Image(systemName: "pencil")
                        }
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = 30
    var corner: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corner,
                                cornerRadii: CGSize(width: radius,
                                                    height: radius)
        )
        
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corner: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corner: corner))
    }
}
