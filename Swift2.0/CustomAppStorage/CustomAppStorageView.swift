//
//  CustomAppStorageView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/21/21.
//  
//

import SwiftUI

struct Settings: Codable {
    let darkMode: Bool
    let name: String
}

struct CustomAppStorageView: View {
    // MARK: - PROPERTIES

    @State private var output: String = ""
    
    @AppStorage("settings")
    private var settingsData: Data = Data()
    
    // MARK: - BODY

    var body: some View {
        VStack {
            
            Text(output)
            
            Button("Load from App Storage") {
                guard let settings = try? JSONDecoder().decode(Settings.self, from: settingsData) else {
                    return
                }
                
                self.output = "isDarkMode: \(settings.darkMode), name: \(settings.name)"
            }
            
            Button("Save in App Storage") {
                let settings = Settings(darkMode: false, name: "Other Name")
                
                guard let settingsData = try? JSONEncoder().encode(settings) else {
                    return
                }
                
                self.settingsData = settingsData
            }
        }
    }
}

// MARK: - PREVIEW

struct CustomAppStorageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAppStorageView()
    }
}
