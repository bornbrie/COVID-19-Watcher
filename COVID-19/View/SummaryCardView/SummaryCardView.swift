//
//  SummaryCardView.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/19/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct SummaryCardView<T: SummaryObject>: View {
    
    var title: String
    var summary: T
    
    #if !os(watchOS)
    var body: some View {
        VStack(spacing: 8) {
            TitleLabel(
                title: self.title,
                fontSize: 20,
                fontWeight: .black
            )
            HStack {
                TotalCasesStatsView(
                    confirmed: summary.totalConfirmed,
                    deaths: summary.totalDeaths,
                    recovered: summary.totalRecovered
                )
                ConfirmedStatsView(
                    new: summary.newConfirmed,
                    total: summary.totalConfirmed
                )
            }
            HStack {
                RecoveredStatsView(
                    new: summary.newRecovered,
                    total: summary.totalRecovered
                )
                DeathsStatsView(
                    new: summary.newRecovered,
                    total: summary.totalRecovered
                )
            }
        }
        .padding()
    }
    #else
    var body: some View {
        VStack(spacing: 8) {
            TitleLabel(
                title: self.title,
                fontSize: 20,
                fontWeight: .black
            )
            TotalCasesStatsView(
                confirmed: summary.totalConfirmed,
                deaths: summary.totalDeaths,
                recovered: summary.totalRecovered
            )
            ConfirmedStatsView(
                new: summary.newConfirmed,
                total: summary.totalConfirmed
            )
            RecoveredStatsView(
                new: summary.newRecovered,
                total: summary.totalRecovered
            )
            DeathsStatsView(
                new: summary.newRecovered,
                total: summary.totalRecovered
            )
        }
        .padding()
    }
    #endif
}

struct SummaryCardView_Previews: PreviewProvider {
    
    struct GlobalSummaryCardViewPreview: View {
        @State var globalSummary = GlobalSummary.demo
        var body: some View {
            GlobalSummaryCardView(globalSummary: globalSummary)
        }
    }
    
    struct CountrySummaryCardViewPreview: View {
        @State var countrySummary = CountrySummary.demo
        @State var watchingCountries = AppPreferences().watchingCountries
        var body: some View {
            CountrySummaryCardView(
                countrySummary: countrySummary,
                watchingCountries: $watchingCountries
            )
        }
    }
    
    static var previews: some View {
        List {
            GlobalSummaryCardViewPreview()
            CountrySummaryCardViewPreview()
        }
    }
}
