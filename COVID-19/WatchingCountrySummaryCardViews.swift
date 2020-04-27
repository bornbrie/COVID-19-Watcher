//
//  WatchingCountrySummaryCardViews.swift
//  COVID-19
//
//  Created by Brianna Lee on 4/25/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct WatchingCountriesSummaryCardViews: View {
    
    @Binding var watchingCountries: [String]
    var countrySummaries: [CountrySummary]
    
    var body: some View {
        ForEach(getWatchingCountrySummaries()) { countrySummary in
            CountrySummaryCardView(
                countrySummary: countrySummary,
                watchingCountries: self.$watchingCountries
            )
        }
    }
    
    private func getWatchingCountrySummaries() -> [CountrySummary] {
        let watchingCountrySummaries = countrySummaries.filter { countrySummary -> Bool in
            return watchingCountries.contains(countrySummary.slug)
        }
        return watchingCountrySummaries
    }
}

struct WatchingCountrySummaryCardViews_Previews: PreviewProvider {
    struct WithFavorites: View {
        @State var watchingCountries: [String] = [
            "united-states",
            "spain",
            "japan",
            "italy"
        ]
        var body: some View {
            WatchingCountriesSummaryCardViews(
                watchingCountries: $watchingCountries,
                countrySummaries: AppState().countries
            )
        }
    }
    static var previews: some View {
        Group {
            ScrollView(.horizontal) {
                WithFavorites()
            }
            List {
                WithFavorites()
            }
        }
    }
}
