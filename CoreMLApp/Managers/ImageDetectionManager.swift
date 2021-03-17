//
//  ImageDetectionManager.swift
//  CoreML
//
//  Created by Jacob LeCoq on 3/15/21.
//

import Foundation
import SwiftUI
import UIKit

class ImageDetectionManager {
    
    let model = Resnet50()
    
    func detect (image: UIImage) -> String? {
        
        guard let pixelBuffer = image.buffer(),
              let prediction = try? model.prediction(image: pixelBuffer) else {
            return nil
        }
        
        return prediction.classLabel
    }
}
