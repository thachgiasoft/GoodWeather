//
//  SearchBar.swift
//  SwiftUIRecipes
//
//  Created by Jacob LeCoq on 3/15/21.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    // MARK: - COORDINATOR CLASS
    class Coordinator: NSObject, UISearchBarDelegate {
    
        @Binding var text: String
        
        init(text: Binding<String>){
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    // MARK: - SEARCH BAR IMPLEMENTATION
    @Binding var text: String
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}
