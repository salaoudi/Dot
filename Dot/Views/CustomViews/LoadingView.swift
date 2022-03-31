//
//  LoadingView.swift
//  Dot
//
//  Created by Zayn on 1/19/22.
//

import SwiftUI

//SIMPLE LOADING VIEW WHEN THE APP STARTS
struct LoadingView: View {
	
    @ObservedObject var themeStore = ThemeManager()
    let allColors: [ThemeModal] = ThemeColors
    
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint:(allColors[self.themeStore.theme].Color)))
                .padding(.vertical, 5)
            Text("Getting Movies...")
                .foregroundColor(allColors[self.themeStore.theme].Color)
        }
        .font(.system(size: 20, weight: .bold, design: .rounded))
    }
}
