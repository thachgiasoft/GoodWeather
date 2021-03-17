//
//  PhotoCaptureView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/15/21.
//  
//

import SwiftUI

struct PhotoCaptureView: View {
    // MARK: - PROPERTIES

    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    
    // MARK: - BODY

    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image)
    }
}

// MARK: - PREVIEW

struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false), image: .constant(Image("")))
    }
}
