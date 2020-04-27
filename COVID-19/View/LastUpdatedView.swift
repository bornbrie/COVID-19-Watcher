//
//  LastUpdatedView.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/25/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct LastUpdatedView: View {
    @Binding var date: String
    var body: some View {
        StatsView(stats:
            Stats(
                title: "Last Updated",
                metrics: [
                    StatMetric(
                        label: "Date",
                        value: date
                    )
                ],
                backgroundColor: Color(.lightGray),
                textColor: .white
            )
        )
        .padding()
    }
}

struct LastUpdatedView_Previews: PreviewProvider {
    struct Today: View {
        @State var date = DateFormatter().string(from: Date())
        var body: some View {
            LastUpdatedView(date: $date)
        }
    }
    static var previews: some View {
        Today()
    }
}
