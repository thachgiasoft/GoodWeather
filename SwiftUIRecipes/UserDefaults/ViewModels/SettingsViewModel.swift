//
//  SettingsViewModel.swift
//  SwiftUIRecipes
//
//  Created by Jacob LeCoq on 3/16/21.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    @Published var isOn: Bool = UserDefaults.standard.bool(forKey: "isOn") {
        didSet {
            UserDefaults.standard.set(self.isOn, forKey: "isOn")
        }
    }
}
