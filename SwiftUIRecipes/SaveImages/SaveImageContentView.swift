//
//  SaveImageContentView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/16/21.
//  
//

import SwiftUI

struct SaveImageContentView: View {
    // MARK: - PROPERTIES
    
    let posters = ["https://fyrafix.files.wordpress.com/2011/08/url-8.jpg", "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg"]

    // MARK: - BODY

    var body: some View {
        List(self.posters, id: \.self){ poster in
            URLImage(url: poster)
                .aspectRatio(contentMode: .fit)
        }
    }
}

// MARK: - PREVIEW

struct SaveImageContentView_Previews: PreviewProvider {
    static var previews: some View {
        SaveImageContentView()
    }
}
