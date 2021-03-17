//
//  UISearchBarContentView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/15/21.
//
//

import SwiftUI

struct UISearchBarContentView: View {
    // MARK: - PROPERTIES

    @State private var searchTerm: String = ""

    let names = ["Jacob", "Mary", "Ian", "Alex", "Jared", "Mark"]

    // MARK: - BODY

    var body: some View {
        List {
            SearchBar(text: $searchTerm)

            ForEach(
                names.filter { name in
                    self.searchTerm.isEmpty || name.localizedStandardContains(self.searchTerm)
                }, id: \.self) { name in
                    Text(name)
            } //: LOOP
        } //: List
        .animation(.default)
    }
}

// MARK: - PREVIEW

struct UISearchBarContentView_Previews: PreviewProvider {
    static var previews: some View {
        UISearchBarContentView()
    }
}
