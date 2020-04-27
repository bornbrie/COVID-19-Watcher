//
//  CountrySummaryCardView.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/25/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct CountrySummaryCardView: View {
    var countrySummary: CountrySummary
    @Binding var watchingCountries: [String]
    var body: some View {
        SummaryCardView<CountrySummary>(
            title: countrySummary.country,
            summary: countrySummary
        )
        .contextMenu {
            WatchCountryButton(
                watchingCountries: $watchingCountries,
                slug: countrySummary.slug
            )
        }
    }
}

struct CountrySummaryCardView_Previews: PreviewProvider {
    struct BindingPreview: View {
        var countrySummary = CountrySummary.demo
        @State var watchingCountries: [String] = ["united-states-of-america"]
        var body: some View {
            CountrySummaryCardView(
                countrySummary: countrySummary,
                watchingCountries: $watchingCountries
            )
        }
    }
    static var previews: some View {
        BindingPreview()
    }
}
