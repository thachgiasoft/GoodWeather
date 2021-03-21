//
//  ContentView.swift
//  Swift2.0
//
//  Created by Jacob LeCoq on 3/19/21.
//

import SwiftUI

struct ListView: Identifiable {
    var id = UUID()
    var name: String
    var view: AnyView

    init(for view: AnyView, name: String) {
        self.view = view
        self.name = name
    }
}

struct ContentView: View {
    private var views = [
        ListView(for: AnyView(MainView()), name: "LazyVGrid"),
        ListView(for: AnyView(HelloProgressView()), name: "ProgressView"),
        ListView(for: AnyView(StateObjWrapperView()), name: "StateObject Wrapper"),
        ListView(for: AnyView(OutlineGroupView()), name: "OutlineGroup"),
        ListView(for: AnyView(LazyGridJsonView()), name: "Lazy Grid w/ JSON"),
        ListView(for: AnyView(CustomAppStorageView()), name: "Custom App Storage"),
        ListView(for: AnyView(MatchedGeometryView()), name: "Matched Geometry Effect"),
        ListView(for: AnyView(MatchedGeoMusicAppView()), name: "Matched Geometry - Music App"),
    ]

    func buildView(types: [Any], index: Int) -> AnyView {
        switch types[index].self {
            case is MainView.Type: return AnyView(MainView())
            default: return AnyView(EmptyView())
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(views) { view in
                    NavigationLink(destination: view.view) {
                        Text(view.name)
                    } //: NAVLINK
                } //: FOREACH
            } //: LOOP
            .navigationTitle("Swift2.0 Items")
        } //: NAV VIEW
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
