//
//  DeathsStatsView.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct DeathsStatsView: View {
    var new: Int
    var total: Int
    var body: some View {
        StatsView(
            stats: Stats(
                title: "Deaths",
                metrics: [
                    StatMetric(
                        label: "New",
                        value: "\(new)"
                    ),
                    StatMetric(
                        label:"Total",
                        value: "\(total)"
                    )
                ],
                backgroundColor: Color.red,
                textColor: Color.white
            )
        )
    }
}

struct DeathsStatsView_Previews: PreviewProvider {
    static var previews: some View {
        DeathsStatsView(new: 0, total: 0)
    }
}
