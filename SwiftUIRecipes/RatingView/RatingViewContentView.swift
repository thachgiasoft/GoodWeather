//
//  RatingViewContentView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/16/21.
//  
//

import SwiftUI

struct RatingViewContentView: View {
    // MARK: - PROPERTIES

    @State private var rating: Int?
    
    // MARK: - BODY

    var body: some View {
        VStack {
            RatingView(rating: $rating)
            Text(rating != nil ? "Rating: \(rating!)/5" : "")
        }
    }
}

// MARK: - PREVIEW

struct RatingViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        RatingViewContentView()
    }
}
