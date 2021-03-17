//
//  ContentView.swift
//  Gestures
//
//  Created by Jacob LeCoq on 3/14/21.
//

import SwiftUI

struct ContentView: View {
    @State private var tapped: Bool = false
    @State private var cardDragState: CGSize = CGSize.zero
    @State private var cardRotation: Double = 0.0
    
    var body: some View {
        CardView(tapped: tapped)
            .rotationEffect(Angle(degrees: cardRotation))
            .animation(.spring())
            .offset(y: self.cardDragState.height)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        self.cardRotation = value.degrees
                    }
                    .onEnded { value in
                        
                    }
            )
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.cardDragState = value.translation
                    }
                    .onEnded { value in
                        self.cardDragState = CGSize.zero
                    }
            )

            .gesture(TapGesture(count: 1).onEnded {
                self.tapped.toggle()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
