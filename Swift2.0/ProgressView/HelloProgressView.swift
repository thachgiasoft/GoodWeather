//
//  ProgressView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/19/21.
//  
//

import SwiftUI

struct HelloProgressView: View {
    // MARK: - PROPERTIES

    @State private var download: CGFloat = 0
    
    // MARK: - BODY

    private func startDownload(){
        let timer = Timer(timeInterval: 0.1, repeats: true){ (timer) in
            if self.download <= 100 {
                self.download += 1
            } else {
                timer.invalidate()
            }
        }
        
        RunLoop.main.add(timer, forMode: .common)
    }
    
    var body: some View {
        VStack {
            VStack {
                ProgressView("Loading", value: self.download, total: 100)
                
                Button("Start Download"){
                    self.startDownload()
                }
            } //: VSTACK
        } //: VSTACK
    }
}

// MARK: - PREVIEW

struct HelloProgressView_Previews: PreviewProvider {
    static var previews: some View {
        HelloProgressView()
    }
}
