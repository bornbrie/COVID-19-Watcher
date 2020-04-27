//
//  WatchingCountriesHostingController.swift
//  CovidWatcher WatchKit Extension
//
//  Created by Brianna Lee on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

class WatchingCountriesHostingController: WKHostingController<WatchWatchingList> {
    
    var countrySummaries = AppState.shared.countries
    @State var watchingCountries = AppPreferences.shared.watchingCountries
    
    override var body: WatchWatchingList {
        return WatchWatchingList(
            watchingCountries: watchingCountries,
            countries: countrySummaries
        )
    }
}

struct WatchWatchingList: View {
    @State var watchingCountries = AppPreferences.shared.watchingCountries
    var countries: [CountrySummary]
    var body: some View {
        ScrollView {
            VStack {
                TitleLabel(title: "Watching")
                if watchingCountries.isEmpty {
                    VStack(alignment: .center, spacing: 8) {
                        Divider()
                        Text("(This doesn't work yet)\n\nYou are not watching any countries yet. \n\nAccess the Covid-19 app on your iPhone, Mac, or Apple TV to start watching countries.")
                    }
                } else {
                    WatchingCountriesSummaryCardViews(
                        watchingCountries: $watchingCountries,
                        countrySummaries: countries
                    )
                }
            }
        }
    }
}
