//
//  RatingView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/16/21.
//  
//

import SwiftUI

struct RatingView: View {
    // MARK: - PROPERTIES
    
    @Binding var rating: Int?
    
    private func starRating(_ index: Int) -> String{
        if let rating = rating {
            return index <= rating ? "star.fill" : "star"
        }
        
        return "star"
    }

    // MARK: - BODY

    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: starRating(index))
                    .foregroundColor(.orange)
                    .onTapGesture {
                        withAnimation {
                            rating = index
                        }
                    }
            }
        }
    }
}

// MARK: - PREVIEW

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
