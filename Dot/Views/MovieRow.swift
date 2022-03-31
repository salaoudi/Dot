//
//  MovieRow.swift
//  Dot
//
//  Created by Zayn on 12/28/21.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

//MOVIE ROW VIEW

struct MovieRow: View {
    
    @EnvironmentObject var manager: StorageManager
    @State var showDetails: Bool = false
    @ObservedObject var themeStore = ThemeManager()
    let allColors: [ThemeModal] = ThemeColors
    
    var movies: MoviesRes
    
    
    
    
    var body: some View {
        ZStack {
            
            
            VStack {
                
                VStack {
                    
                    VStack {
                        
                        HStack() {
                            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movies.poster_path)"))
                                .resizable().clipShape(RoundedRectangle(cornerRadius: 25))
                                .frame(minWidth: 200, idealWidth: 200, maxWidth: 200, minHeight: 300, idealHeight: 300, maxHeight: 300)
                                .overlay(
                                    
                                    VStack {
                                        Spacer()
                                        HStack {
                                            HStack {
                                                Image(systemName: "star")
                                                    .font(.system(size: 13, weight: .bold))
                                                Text(String.init(format: "%0.2f", movies.vote_average))
                                                
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
                                                    checkAndAddBookmark()
                                                    
                                                }){
                                                    Image(systemName: manager.BookmarkedMovies.contains(movies) ? "bookmark.fill" : "bookmark")
                                                    
                                                    
                                                }
                                                
                                                
                                            }
                                            .font(.system(size: 16, weight: .bold, design: .rounded))
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 10)
                                            .foregroundColor(Color.white)
                                            .background(allColors[self.themeStore.theme].Color)
                                            .cornerRadius(13)
                                            .shadow(color: allColors[self.themeStore.theme].Color.opacity(0.9), radius: 7, x: 0, y: 0)
                                            
                                            
                                            
                                        }
                                        
                                    }
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                    
                                )
                            
                        }
                        .padding(.leading)
                        
                        
                        VStack() {
                            HStack {
                                Text(movies.original_title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Spacer()
                            }
                            .frame(width: 190, height: 50, alignment: .top)
                            
                            
                        }
                        
                    }
                    .padding(.leading)
                    .frame(minWidth: 200, idealWidth: 200, maxWidth: 200, minHeight: 410, idealHeight: 410, maxHeight: 410)
                    .sheet(isPresented: $showDetails) {
                        MovieDetails(movies: movies)
                    }
                    .onTapGesture {
                        showDetails = true
                    }
                    
                    
                    
                }
                
                
            }
            
            
        }
    }
    
    func checkAndAddBookmark() {
        if !manager.BookmarkedMovies.contains(movies) {
            manager.BookmarkedMovies.append(movies)
            
        }
    }
    
}


