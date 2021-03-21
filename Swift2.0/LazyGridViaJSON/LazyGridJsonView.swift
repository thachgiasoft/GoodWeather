//
//  LazyGridJsonView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/20/21.
//
//

import SwiftUI

struct LazyGridJsonView: View {
    // MARK: - PROPERTIES

    @StateObject var store = MovieStore()

    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    // MARK: - BODY

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(store.movies ?? [Movie](), id: \.imdbID) { movie in
                        
                        NavigationLink(destination: Text(movie.title)) {
                            VStack {
                                URLImage(url: movie.poster)
                                    .frame(width: 100, height: 150)
                                
                                Text(movie.title)
                                    .frame(maxHeight: .infinity, alignment: .top)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Movies")
        }
        .onAppear {
            store.getAll()
        }
    }
}

// MARK: - PREVIEW

struct LazyGridJsonView_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridJsonView()
    }
}
