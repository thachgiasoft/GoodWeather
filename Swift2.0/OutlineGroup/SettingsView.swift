//
//  SettingsView.swift
//  StorageDemo
//
//  Created by Mohammad Azam on 6/30/20.
//

import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        return NavigationView {
            self
        }
    }
}

struct SettingsView: View {
    @State private var animalsExpanded: Bool = true
    @State private var fruitsExpanded: Bool = false

    let animals = ["🦙", "🦘", "🐆", "🦛"]
    let fruits = ["🍒", "🍉", "🍑"]
    
    var body: some View {
        Form {
            DisclosureGroup(
                isExpanded: $animalsExpanded,
                content: {
                    HStack {
                        ForEach(animals, id: \.self) { animal in
                            Text(animal)
                                .font(.system(size: 50))
                        }
                    }
                },
                label: { Text("Animals") }
            )
            
            DisclosureGroup(
                isExpanded: $fruitsExpanded,
                content: {
                    ForEach(fruits, id:\.self){fruit in
                        Text(fruit)
                    }
                },
                label: { Text("Fruits") }
)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
