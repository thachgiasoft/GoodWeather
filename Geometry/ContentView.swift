//
//  ContentView.swift
//  Geometry
//
//  Created by Jacob LeCoq on 3/14/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BarGraph(reports: Report.allReports())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
