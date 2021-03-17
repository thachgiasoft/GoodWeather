//
//  ContentView.swift
//  CapturingPhotoSwiftUI
//
//  Created by Jacob LeCoq on 3/15/21.
//

import SwiftUI

struct ImagePickerContentView: View {
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    
    var body: some View {
        VStack {
            image?.resizable().scaledToFit()
            
            Button("Open Camera"){
                self.showImagePicker = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        } //: VSTACK
        .sheet(isPresented: self.$showImagePicker){
            PhotoCaptureView(showImagePicker: $showImagePicker, image: $image)
        }
    }
}

struct ImagePickerContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerContentView()
    }
}
