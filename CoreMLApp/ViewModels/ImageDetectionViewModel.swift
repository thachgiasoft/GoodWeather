//
//  ImageDetectionViewModel.swift
//  CoreML
//
//  Created by Jacob LeCoq on 3/15/21.
//

import Foundation
import SwiftUI
import Combine

class ImageDetectionViewModel: ObservableObject {
    var name: String = ""
    var manager: ImageDetectionManager
    
    @Published var predictionLabel: String = ""
    
    init(manager: ImageDetectionManager){
        self.manager = manager
    }
    
    func detectImage(_ name: String){
        
        let sourceImage = UIImage(named: name)
        
        // resize image
        guard let resizedImage = sourceImage?.resizeImage(size: CGSize(width: 224, height: 224)) else {
            fatalError("failed to resize")
        }
        
        // detect image
        if let label = self.manager.detect(image: resizedImage) {
            self.predictionLabel = label
        }
    }
}
