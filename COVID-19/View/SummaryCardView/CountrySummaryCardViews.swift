//
//  CountrySummaryCardViews.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/21/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct CountrySummaryCardViews: View {
    
    @ObservedObject var state: AppState
    @ObservedObject var preferences: AppPreferences
    @Binding var query: String
    
    var body: some View {
        ForEach(getCountries(with: query)) { countrySummary in
            CountrySummaryCardView(
                countrySummary: countrySummary,
                watchingCountries: self.$preferences.watchingCountries
            )
        }
    }
    
    private func getCountries(with query: String) -> [CountrySummary] {
        let filteredCountries = state.countries.filter { countrySummary -> Bool in
            let query = query.lowercased()
            
            let country = countrySummary.country.lowercased()
            let containsCountry = country.contains(query)
            
            let countryCode = countrySummary.countryCode.lowercased()
            let containsCountryCode = countryCode.contains(query)
            
            return query.isEmpty ? true : containsCountry || containsCountryCode
        }
        let sortedCountries = filteredCountries.sorted { lhs, rhs -> Bool in
            return lhs.totalConfirmed > rhs.totalConfirmed
        }
        return sortedCountries
    }
}

struct Countries_Previews: PreviewProvider {
    
    struct AllCountries: View {
        @State private var query = ""
        var body: some View {
            CountrySummaryCardViews(
                state: AppState(),
                preferences: AppPreferences(),
                query: $query
            )
        }
    }
    
    struct FilteredCountries: View {
        @State private var query = "united "
        var body: some View {
            CountrySummaryCardViews(
                state: AppState(),
                preferences: AppPreferences(),
                query: $query
            )
        }
    }
    
    static var previews: some View {
        List {
            Section(header: Text("Countries")) {
                AllCountries()
                FilteredCountries()
            }
        }
    }
}
