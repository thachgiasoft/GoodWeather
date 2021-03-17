//
//  URLImage.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/16/21.
//  
//

import SwiftUI

struct URLImage: View {
    // MARK: - PROPERTIES

    let url: String
    let placeholder: String
    
    @ObservedObject private var imageLoader = ImageLoader()
    
    init(url: String, placeHolder: String = "placeholder"){
        self.url = url
        self.placeholder = placeHolder
        self.imageLoader.downloadImage(url: url)
    }
    
    // MARK: - BODY

    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        
        return Image(placeholder)
    }
}

// MARK: - PREVIEW

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg")
    }
}
