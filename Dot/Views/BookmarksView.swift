//
//  BookmarksView.swift
//  Dot
//
//  Created by Zayn on 12/28/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookmarksView: View {
    
    @EnvironmentObject var manager: StorageManager
    @ObservedObject var themeStore = ThemeManager()
    let allColors: [ThemeModal] = ThemeColors
    let layout = Array(repeating: GridItem(.flexible(), spacing: 1), count: 2)
    
    var body: some View {
        
        if manager.BookmarkedMovies.isEmpty {
            
            VStack {
                VStack {
                    AppHeader(AppHeader: "Bookmarks", HeaderImage: "bookmark")
                }
                Spacer()
                VStack() {
                    Spacer()
                    Image(systemName: "bookmark")
                        .foregroundColor(allColors[self.themeStore.theme].Color)
                        .font(.system(size: 80, weight: .thin))
                        .padding()
                    Text("No Movies Has Been Added To Bookmarks")
                        .foregroundColor(allColors[self.themeStore.theme].Color)
                        .frame(width: 300)
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.center)
                    Spacer()
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(50)
                
            }
            
            
        } else {
            VStack {
                AppHeader(AppHeader: "Bookmarks", HeaderImage: "bookmark")
               
                ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: layout){
                   
                   
                            
                            ForEach(manager.BookmarkedMovies) { marked in
                                VStack {
                                    WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(marked.poster_path)"))
                                        .resizable().clipShape(RoundedRectangle(cornerRadius: 15))
                                        .frame(width: 170, height: 270)
                                        .overlay(
                                            
                                            VStack {
                                                Spacer()
                                                HStack {
                                                    HStack {
                                                        Image(systemName: "star")
                                                            .font(.system(size: 13, weight: .bold))
                                                        
                                                        Text(String.init(format: "%0.2f", marked.vote_average))
                                                        
                                                    }
                                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                                    .padding(.horizontal, 10)
                                                    .padding(.vertical, 10)
                                                    .foregroundColor(Color.white)
                                                    .background(allColors[self.themeStore.theme].Color)
                                                    .cornerRadius(10)
                                                    .shadow(color: allColors[self.themeStore.theme].Color.opacity(0.9), radius: 7, x: 0, y: 0)
                                                    
                                                    Spacer()
                                                    
                                                    HStack {
                                                        Button(action: {
                                                            manager.BookmarkedMovies.removeAll(where: {$0 == marked})
                                                        }){
                                                            Image(systemName: "trash")
                                                        }
                                                    }
                                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                                    .padding(.horizontal, 10)
                                                    .padding(.vertical, 10)
                                                    .foregroundColor(Color.white)
                                                    .background(allColors[self.themeStore.theme].Color)
                                                    .cornerRadius(10)
                                                    .shadow(color: allColors[self.themeStore.theme].Color.opacity(0.9), radius: 7, x: 0, y: 0)
                                                    
                                                    
                                                }
                                                
                                            }
                                            .padding(10)
                                            
                                        )
                                    VStack() {
                                        HStack {
                                            Text(marked.original_title)
                                                .font(.system(size: 16, weight: .bold))
                                                
                                            
                                            Spacer()
                                        }
                                        .frame(width: 170, height: 40, alignment: .top)
                                        
                                        
                                    }
                                }
                                .padding(.bottom, 30)
                                
                                
                            }
                            
                            
                            
                 
                }
                .padding(.bottom, 100)
                
                
                
            }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(50)
                
                
            }
            
            
        }
       
    }
    
    
}
