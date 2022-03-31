//
//  AppHeader.swift
//  Dot
//
//  Created by Zayn on 1/19/22.
//

import SwiftUI


//APP TOP HEADER   
struct AppHeader: View {
    
    var AppHeader = ""
    var HeaderImage: String
    @ObservedObject var themeStore = ThemeManager()
    let allColors: [ThemeModal] = ThemeColors
    
    var body: some View {
        HStack {
            Image(systemName: HeaderImage)
                .font(.system(size: 35, weight: .regular))
                .foregroundColor(allColors[self.themeStore.theme].Color)
            RoundedRectangle(cornerRadius: 100, style: .continuous)
                .foregroundColor(allColors[self.themeStore.theme].Color)
                .frame(width: 2, height: 30)
                .padding(.trailing, 5)
                .padding(.leading, -1)
            Text(AppHeader)
                .font(.system(size: 40, weight: .regular, design: .rounded))
                .foregroundColor(allColors[self.themeStore.theme].Color)
                .padding(.leading, -6)
            Spacer()
              
        }
        .padding(.horizontal)
        .padding(.bottom, 5)
    }
}
