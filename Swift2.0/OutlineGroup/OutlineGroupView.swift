//
//  OutlineGroupView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/20/21.
//
//

import SwiftUI

struct ListItem: Identifiable {
    let id: UUID = UUID()
    let name: String
    var items: [ListItem]?
}

extension ListItem {
    
    static func all() -> [ListItem] {
        
        let animals = [ListItem(name: "🐶"),ListItem(name: "🐰")]
        let fruits = [ListItem(name: "🍑"), ListItem(name: "🍉"), ListItem(name: "🍌")]
        let cars = [ListItem(name: "🚗"), ListItem(name: "🚕"), ListItem(name: "🚙"), ListItem(name: "🚌"), ListItem(name: "🏎")]
                
        return [ListItem(name: "Animals", items: animals), ListItem(name: "Fruits", items: fruits), ListItem(name: "Vehicles", items: cars)]
    }
    
}

struct OutlineGroupView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY

    var body: some View {
        List {
            ForEach(ListItem.all()) { category in
                Section(header: EmptyView()){
                    OutlineGroup(category, children: \.items){ item in
                        Text(item.name)
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEW

struct OutlineGroupView_Previews: PreviewProvider {
    static var previews: some View {
        OutlineGroupView()
    }
}
