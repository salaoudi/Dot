//
//  HomeView.swift
//  Dot
//
//  Created by Zayn on 12/26/21.
//



//MAIN MOVIES HEAD VIEW

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @StateObject var vm  = ViewModal()
    @ObservedObject var themeStore = ThemeManager()
    let allColors: [ThemeModal] = ThemeColors
    
    var body: some View {
        VStack {
            HStack {
                AppHeader(AppHeader: "Dot", HeaderImage: "waveform.circle")

                Menu(content:  {
                    
                    Button(action: {}) {
                        Text("Popular")
                    }
                    
                    Button(action: {}) {
                        Text("Top Rated")
                    }
                    
                    Button(action: {}) {
                        Text("Upcoming")
                    }
                    
                    
                    
                }) {
                    Image(systemName: "square.split.2x2.fill")
                        .font(.system(size: 22))
                        .foregroundColor(allColors[self.themeStore.theme].Color)
                }
                .menuStyle(BorderlessButtonMenuStyle())
                .padding(.horizontal)
            }
            
            VStack {
                HStack {
                    MoviesHeader(MoviesHeader: "Popular")
                    Spacer()
                }
                
                if vm.moviesDB.isEmpty {
                    VStack {
                        Spacer()
                        LoadingView()
                        Spacer()
                        Spacer()
                    }
                } else {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        
                        HStack(spacing: -7) {
                            
                            ForEach(vm.moviesDB) { movies in
                                
                                HStack() {
                                    MovieRow(movies: movies)
                                }
                            }
                            .padding(.trailing, 30)

                        }
                        
                       
                    }
                    
                }
                Spacer()
            }
            .background(Color.secondary.opacity(0.1))
            .cornerRadius(50)
          
        }
        
    }
}


