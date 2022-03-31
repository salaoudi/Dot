//
//  ViewModal.swift
//  Dot
//
//  Created by Zayn on 12/26/21.
//

import Foundation
import Combine
import SwiftUI


class ViewModal: ObservableObject {
    
    
    @Published var moviesDB =  [MoviesRes]()
    
    
    
    
    init() {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=ac8cfedb37ce6a20dcf408630a7fe1e5&language=en-US&page=1"
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _,_) in
            do {
                let fetch = try JSONDecoder().decode(Movies.self, from: data!)
                
                DispatchQueue.main.async {
                    self.moviesDB = fetch.results
                }
                
            } catch {
                print("ERROR")
            }
            
        }.resume()
    }
    
    
    
}
