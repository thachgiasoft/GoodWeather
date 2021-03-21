//
//  CutomXcodeView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/20/21.
//  
//

import SwiftUI

extension Image {
    
    func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
    }
    
}


struct CutomXcodeView: View {
    // MARK: - PROPERTIES

    @State private var rating: Int?
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            
            Image("coffee")
                // Open library and search for resizedToFill from
                // modifiers list
                .resizedToFill(width: /*@START_MENU_TOKEN@*/150/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/150/*@END_MENU_TOKEN@*/)
            
            // Open up Library menu and search for rating view from views list
            // It should pop up and be selectable to fill
            RatingView(rating: $rating).padding()
            
            Text(rating != nil ? "You rating: \(rating!)" : "")
        }
    }
}

// MARK: - PREVIEW

struct CutomXcodeView_Previews: PreviewProvider {
    static var previews: some View {
        CutomXcodeView()
    }
}
