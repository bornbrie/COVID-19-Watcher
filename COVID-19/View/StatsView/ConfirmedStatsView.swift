//
//  ConfirmedStatsView.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct ConfirmedStatsView: View {
    var new: Int
    var total: Int
    var body: some View {
        StatsView(stats: Stats(
            title: "Confirmed",
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
            backgroundColor: Color(.yellow),
            textColor: Color.black
        ))
    }
}

struct ConfirmedStatsView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmedStatsView(
            new: 0,
            total: 0
        )
    }
}
