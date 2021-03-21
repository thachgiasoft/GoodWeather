//
//  StateObjWrapperView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/19/21.
//  
//

import SwiftUI

class Counter: ObservableObject {
    @Published var value: Int = 0
}

struct CounterView: View {
    
    @StateObject var counter = Counter()
    
    var body: some View {
        VStack {
            Text("\(counter.value)")
            Button("Counter View Increment") {
                counter.value += 1
            }
        }.padding()
        .background(Color.green)
    }
}

struct StateObjWrapperView: View {
    // MARK: - PROPERTIES

    @State private var count: Int = 0
    
    // MARK: - BODY

    var body: some View {
        VStack {
            Text("CONTENT VIEW")
            Text("\(count)")
            Button("Increment ContentView Counter") {
                count += 1
            }
                
            CounterView()
        }.padding()
        .background(Color.yellow)
    }
}

// MARK: - PREVIEW

struct StateObjWrapperView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjWrapperView()
    }
}
