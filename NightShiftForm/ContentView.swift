//
//  ContentView.swift
//  NightShiftForm
//
//  Created by Jacob LeCoq on 3/14/21.
//

import SwiftUI

struct ContentView: View {
    @State private var scheduled: Bool = false
    @State private var manualTilTomorrow: Bool = false
    @State private var warmValue: CGFloat = 0.5
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Night shift automatically shift the colors of your display to the warmer end of the color spectrum after dark. This may help you get a better night's sleep.").padding(5).lineLimit(nil)) {
                    Toggle(isOn: $scheduled){
                        Text("Scheduled")
                    }
                    
                    HStack {
                        VStack(alignment: .leading){
                            Text("From")
                            Text("To")
                        }
                        
                        Spacer()
                        
                        NavigationLink (destination: Text("Scheduled Settings")){
                            VStack{
                                Text("Sunset")
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                Text("Sunrise")
                                    .foregroundColor(Color.blue)
                            }
                        } //: NAV LINK
                        .fixedSize()
                    } //: HSTACK
                } //: SECTION
                
                Section() {
                    Toggle(isOn: $manualTilTomorrow){
                        Text("Manually enable until tomorrow").bold()
                    }
                } //: SECTION
                
                Section(header: Text("COLOR TEMP")) {
                    HStack {
                        Text("Less Warm")
                        
                        Slider(value: $warmValue)
                        
                        Text("More Warm")
                    } //: HSTACK
                }
            } //: FORM
        } //: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
