//
//  NotificationView.swift
//  CovidWatcher WatchKit Extension
//
//  Created by Brianna Lee on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var state = AppState()
    var body: some View {
        GlobalSummaryCardView(globalSummary: state.globalSummary)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(state: AppState())
    }
}

struct WorldTotalsCardView: View {
    @Binding var worldTotal: WorldTotal
    var body: some View {
        TotalCasesCardView(
            title: "Global",
            totals: worldTotal
        )
    }
}

struct TotalCasesCardView<T: TotalCasesObject>: View {
    
    var title = "World Totals"
    var totals: T
    
    var body: some View {
        VStack(spacing: 8) {
            TitleLabel(
                title: self.title,
                fontSize: 20,
                fontWeight: .black
            )
            
            #if !os(watchOS)
            HStack {
                AllCasesTotalStatsView(
                    confirmed: totals.totalConfirmed,
                    deaths: totals.totalDeaths,
                    recovered: totals.totalRecovered
                )
                ConfirmedTotalStatsView(confirmed: totals.totalConfirmed)
            }
            #else
            AllCasesTotalStatsView(
                confirmed: totals.totalConfirmed,
                deaths: totals.totalDeaths,
                recovered: totals.totalRecovered
            )
            ConfirmedTotalStatsView(confirmed: totals.totalConfirmed)
            #endif
            
            #if !os(watchOS)
            HStack {
                DeathsTotalStatsView(deaths: totals.totalDeaths)
                ExtractedView()
            }
            #else
            DeathsTotalStatsView(deaths: totals.totalDeaths)
            RecoveredTotalStatsView(recovered: totals.totalRecovered)
            #endif
        }
        .padding()
    }
}

struct AllCasesTotalStatsView: View {
    var confirmed: Int
    var deaths: Int
    var recovered: Int
    var body: some View {
        StatsView(stats:
            Stats(
                title: "All Cases",
                metrics: [
                    StatMetric(
                        label: nil,
                        value: "\(confirmed + deaths + recovered)"
                    )
                ],
                backgroundColor: Color.yellow,
                textColor: .black
            )
        )
    }
}

struct ConfirmedTotalStatsView: View {
    var confirmed: Int
    var body: some View {
        StatsView(stats:
            Stats(
                title: "Confirmed",
                metrics: [
                    StatMetric(
                        label: nil,
                        value: "\(confirmed)"
                    )
                ],
                backgroundColor: Color.yellow,
                textColor: .black
            )
        )
    }
}

struct DeathsTotalStatsView: View {
    var deaths: Int
    var body: some View {
        StatsView(stats:
            Stats(
                title: "Deaths",
                metrics: [
                    StatMetric(
                        label: nil,
                        value: "\(deaths)"
                    )
                ],
                backgroundColor: Color.red,
                textColor: .white
            )
        )
    }
}

struct RecoveredTotalStatsView: View {
    var recovered: Int
    var body: some View {
        StatsView(stats:
            Stats(
                title: "Recovered",
                metrics: [
                    StatMetric(
                        label: nil,
                        value: "\(recovered)"
                    )
                ],
                backgroundColor: Color.green,
                textColor: .white
            )
        )
    }
}
