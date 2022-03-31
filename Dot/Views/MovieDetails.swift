//
//  MovieDetails.swift
//  Dot
//
//  Created by Zayn on 1/13/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetails: View {
    
    @ObservedObject var themeStore = ThemeManager()
    let allColors: [ThemeModal] = ThemeColors
    let movies: MoviesRes
    
    
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 100, style: .continuous)
                    .fill(Color.white.opacity(0.9))
                    .frame(maxWidth: 50, maxHeight: 4)
                    .padding(.top, -10)
                
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        
                        WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(self.movies.poster_path)"))
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .frame(minWidth: 240, idealWidth: 240, maxWidth: 240, minHeight: 360, idealHeight: 360, maxHeight: 360)
                        Spacer()
                        VStack {
                            VStack {
                                Image(systemName: "star")
                                    .font(.system(size: 18))
                                Text("Rating")
                                Text(String.init(format: "%0.2f", self.movies.vote_average))
                                
                            }
                            .foregroundColor(.white)
                            .padding(8)
                            .frame(width: 110, height: 100)
                            .background(Color.secondary.opacity(0.2))
                            .cornerRadius(17)
                            
                            VStack {
                                Image(systemName: "clock")
                                    .font(.system(size: 18))
                                Text("Release")
                                Text("\(self.movies.release_date)")
                                
                            }
                            .foregroundColor(.white)
                            .padding(8)
                            .frame(width: 110, height: 100)
                            .background(Color.secondary.opacity(0.2))
                            .cornerRadius(17)
                            .padding(.top, 20)
                            
                            VStack {
                                Image(systemName: "hand.thumbsup")
                                    .font(.system(size: 18))
                                Text("Total Votes")
                                Text("\(movies.vote_count)")
                                
                            }
                            .foregroundColor(.white)
                            .padding(8)
                            .frame(width: 110, height: 100)
                            .background(Color.secondary.opacity(0.2))
                            .cornerRadius(17)
                            .padding(.top, 20)
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                    
                    
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(movies.original_title)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 25, weight: .heavy))
                                RoundedRectangle(cornerRadius: 100, style: .continuous)
                                    .fill(Color.secondary.opacity(0.5))
                                    .frame(maxWidth: .infinity, maxHeight: 2)
                            }
                            Spacer()
                            
                        }
                        .padding(.horizontal)
                        
                        
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Overview")
                            .padding(.vertical)
                            .font(.system(size: 20, weight: .heavy))
                        HStack {
                            Text(movies.overview)
                                .font(.system(size: 20, weight: .semibold))
                            
                           
                        }
                        
                    }
                    .foregroundColor(Color.white)
                    .padding(.horizontal)
                    
                }
                
                
                Spacer()
            }
            
        }
        .padding(.top, 20)
        .padding(.horizontal, 10)
        .background(allColors[self.themeStore.theme].Color)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MovieDetails_Previews: PreviewProvider {
    
    static var previews: some View {
        
        
        
        MovieDetails(movies: MoviesRes(id: 1, release_date: "2", original_title: "2", poster_path: "221", overview: "21", popularity: 2.2, vote_average: 2.2, vote_count: 12))
    }
}
