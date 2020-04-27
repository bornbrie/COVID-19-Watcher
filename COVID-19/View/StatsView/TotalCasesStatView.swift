//
//  TotalCasesStatsView.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct TotalCasesStatsView: View {
    var confirmed: Int
    var deaths: Int
    var recovered: Int
    var body: some View {
        StatsView(stats:
            Stats(
                title: "Total Cases",
                metrics: [
                    StatMetric(
                        label: nil,
                        value: "\(confirmed + deaths + recovered)"
                    )
                ],
                backgroundColor: Color(UIColor.darkGray),
                textColor: Color.white
            )
        )
    }
}

struct TotalCasesStatView_Previews: PreviewProvider {
    static var previews: some View {
        TotalCasesStatsView(
            confirmed: 0,
            deaths: 0,
            recovered: 0
        )
    }
}
