//
//  UserDefaultsContentView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/16/21.
//  
//

import SwiftUI

struct UserDefaultsContentView: View {
    // MARK: - PROPERTIES
    
    @ObservedObject private var settingsViewModel = SettingsViewModel()

    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .center) {
            
            Toggle(isOn: self.$settingsViewModel.isOn) {
                Text("")
            }.fixedSize()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(self.settingsViewModel.isOn ? Color.green : Color.red)
    }
}

// MARK: - PREVIEW

struct UserDefaultsContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsContentView()
    }
}
