//
//  SettingsView.swift
//  Dot
//
//  Created by Zayn on 1/10/22.
//

import SwiftUI

struct SettingsView: View {
    
	
	//APP SETTINGS VIEW 
    @StateObject var themeStore = ThemeManager()
    let allColors: [ThemeModal] = ThemeColors
    
    
    var body: some View {
        VStack {
            HStack {
                AppHeader(AppHeader: "Settings", HeaderImage: "hexagon")
            }
                
            VStack {
                VStack() {
                    VStack() {
                        HStack {
                            Text("Theme")
                            Spacer()
                        }
                        .padding(.bottom, -10)
                        .padding(.horizontal)
                        HStack {
                            ForEach(allColors, id: \.id) { color in
                                Button(action: {
                                    self.themeStore.theme = color.id
                                    UserDefaults.standard.set(self.themeStore.theme, forKey: "ThemeModal")
                                }){
                                    
                                    if themeStore.theme == color.id {
                                        Image(systemName: "circle.dashed.inset.fill")
                                            .foregroundColor(color.Color)
                                            .font(.system(size: 33))
                                        
                                    } else {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(color.Color)
                                            .font(.system(size: 33))
                                    }
                                    
                      
                                   
                                }
                                .padding(5)
                                .shadow(color: Color.black.opacity(0.9), radius: 2, x: 0, y: 0)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(allColors[self.themeStore.theme].Color)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.2), radius: 15, x: 0, y: 0)
                        .padding()
                    }
                   
                }
                .foregroundColor(Color.primary.opacity(0.7))
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding(.horizontal).padding(.vertical, 25)
                
                
               Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.secondary.opacity(0.1))
            .cornerRadius(50)
           
        }
    }
}
