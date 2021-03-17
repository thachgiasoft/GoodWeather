//
//  BarGraph.swift
//  Geometry
//
//  Created by Jacob LeCoq on 3/14/21.
//

import Foundation
import SwiftUI

struct BarGraph: View {
    
    let reports: [Report]
    
    var body: some View {
        VStack {
            HStack (alignment: .lastTextBaseline){
                ForEach(reports, id: \.year) { report in
                    BarView(report: report)
                }
            }
        }
    }
}

struct BarGraph_previw: PreviewProvider {
    static var previews: some View {
        BarGraph(reports: Report.allReports())
    }
}

struct BarView: View {
    @State private var showGraph: Bool = false
    
    let report: Report
    
    var body: some View {
        let value = report.revenue / 500
        let yValue = Swift.min(value * 20, 500)
        
        print(CGFloat(yValue))
        return VStack {
            
            Spacer()
            
            Text(String(format: "$%.2f", report.revenue))
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red)
                .frame(width: 100, height: self.showGraph ? CGFloat(yValue) : 0.0)
                .opacity(self.showGraph ? 1 : 0.1)
                .onAppear(){
                    withAnimation(.spring(response: 1, dampingFraction: 0.6, blendDuration: 0)){
                        self.showGraph = true
                    }
                }
            
            Text(report.year)
        }
    }
}
