//
//  MoviesHeader.swift
//  Dot
//
//  Created by Zayn on 1/19/22.
//

import SwiftUI

//MOVIES TOP HEADERS 
struct MoviesHeader: View {
    
    var MoviesHeader = ""
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(MoviesHeader)
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 30)
        .padding(.bottom, -5)
    }
}
