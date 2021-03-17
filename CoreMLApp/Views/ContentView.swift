//
//  ContentView.swift
//  CoreML
//
//  Created by Jacob LeCoq on 3/15/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedImage: String = ""
    
    let images = ["cat1", "dog", "mountains", "tree"]
    
    @ObservedObject private var imageDetectionVM: ImageDetectionViewModel
    private var imageDetectionManager: ImageDetectionManager
    
    init(){
        self.imageDetectionManager = ImageDetectionManager()
        self.imageDetectionVM = ImageDetectionViewModel(manager: self.imageDetectionManager)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal){
                    HStack {
                        ForEach (images, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .padding()
                                .onTapGesture {
                                    self.selectedImage = image
                                }
                                .border(Color.black, width: self.selectedImage == image ? 10 : 0)
                        } //: LOOP
                    } //: HSTACK
                } //: SCROLLVIEW
                
                Button("Detect Image"){
                    self.imageDetectionVM.detectImage(self.selectedImage)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                
                Text(self.imageDetectionVM.predictionLabel)
                
            } //: VSTACK
            .navigationTitle("Core ML")
        } //: NAV
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
