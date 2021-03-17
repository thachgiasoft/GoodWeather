//
//  CardView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/14/21.
//  
//

import SwiftUI
import Foundation

struct CardView: View {
    // MARK: - PROPERTIES

    @State private var scale: CGFloat = 1.0
    
    let tapped: Bool
    
    // MARK: - BODY

    var body: some View {
        VStack {
            
            Image("cat")
                .resizable()
                .scaleEffect(scale)
                .frame(width: 300, height: 300)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            self.scale = value.magnitude
                        }
                        .onEnded { value in
                            
                        }
                )
            
            Text("Card")
                .font(.largeTitle)
                .foregroundColor(Color.white)
        } //: VSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(self.tapped ? Color.orange : Color.purple)
        .cornerRadius(30)
    }
}

// MARK: - PREVIEW

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(tapped: false)
    }
}
