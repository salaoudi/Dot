//
//  moviesApi.swift
//  Dot
//
//  Created by Zayn on 12/26/21.
//

import Foundation
import SwiftUI

//MAIN MOVIES MODAL 
struct Movies: Decodable {
    var results: [MoviesRes]
}

struct MoviesRes: Identifiable, Hashable, Equatable, Decodable, Encodable {
    var id: Int
    var release_date: String
    var original_title: String
    var poster_path: String
    var overview: String
    var popularity: Double
    var vote_average: CGFloat
    var vote_count: Int
}

