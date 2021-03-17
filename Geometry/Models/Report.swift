//
//  Report.swift
//  Geometry
//
//  Created by Jacob LeCoq on 3/14/21.
//

import Foundation

struct Report: Hashable {
    let year: String
    let revenue: Double
}

extension Report {
    
    static func allReports() -> [Report] {
        return [
            Report(year: "2001", revenue: 2500),
            Report(year: "2002", revenue: 4500),
            Report(year: "2003", revenue: 6500),
        ]
    }
}
