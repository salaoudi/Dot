//
//  ContentView.swift
//  Dot
//
//  Created by Zayn on 12/26/21.
//

import SwiftUI

// MIAN TABBAR AND CONTENT VIEW
struct ContentView: View {
    
    @State var currentTab = 0
    
    
    var body: some View {
        ZStack {
            if currentTab == 0 {
                HomeView()
                    .environmentObject(StorageManager.shared)
            } else if currentTab == 1 {
                BookmarksView()
                    .environmentObject(StorageManager.shared)
            } else if currentTab == 2 {
                SettingsView()
            } else {
                HomeView()
            }
            
            VStack {
                
                Spacer()
                TabBar(currentTab: $currentTab)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}




struct TabBar: View {
    
    @Binding var currentTab: Int
    @ObservedObject var themeStore = ThemeManager()
    let allColors: [ThemeModal] = ThemeColors
    
    var body: some View {
        
        HStack {
            Button(action: {
                self.currentTab = 0
            }){
                
                HStack {
                    Image(systemName: "safari")
                    if self.currentTab == 0 {
                        Text("Discover")
                            .font(.system(size: 18, weight: .regular, design: .rounded))
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 12)
                
                
            }
            .foregroundColor(Color.white)
            .background(Color.black.opacity(currentTab == 0 ? 0.2 : 0.0))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Button(action: {
                self.currentTab = 1
            }){
                HStack {
                    Image(systemName: "bookmark")
                    if self.currentTab == 1 {
                        Text("Bookmarks")
                            .font(.system(size: 18, weight: .regular, design: .rounded))
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 12)
                
                
            }
            .foregroundColor(Color.white)
            .background(Color.black.opacity(currentTab == 1 ? 0.2 : 0.0))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Button(action: {
                self.currentTab = 2
            }){
                
                HStack {
                    Image(systemName: "hexagon")
                    if self.currentTab == 2 {
                        Text("Settings")
                            .font(.system(size: 18, weight: .regular, design: .rounded))
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 12)
                
                
            }
            .foregroundColor(Color.white)
            .background(Color.black.opacity(currentTab == 2 ? 0.2 : 0.0))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        .background(allColors[self.themeStore.theme].Color)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
        .cornerRadius(20)
        .animation(.easeInOut)
        
    }
    
}
