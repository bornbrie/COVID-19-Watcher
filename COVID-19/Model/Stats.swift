//
//  Stats.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct Stats {
    var title: String?
    var metrics: [StatMetric] = []
    var backgroundColor: Color
    var textColor: Color
}

struct StatMetric: Codable, Identifiable {
    var id = UUID().uuidString
    var label: String?
    var value: String
}
