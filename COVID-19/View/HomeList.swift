//
//  HomeList.swift
//  COVID-19
//
//  Created by Brianna Lee on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    @ObservedObject var state: AppState
    @ObservedObject var preferences: AppPreferences
    @Binding var showSafari: Bool
    var body: some View {
        List {
            LastUpdatedView(date: $state.date)
            if state.loading {
                Text("Loading...").foregroundColor(.gray)
            }
            GlobalSummaryCardView(
                globalSummary: state.globalSummary
            )
            NavigationLink(destination:
                CountrySummaryList(
                    state: state,
                    preferences: preferences,
                    query: $state.countrySearchQuery
                )
            ) {
                Text("All Countries")
            }
            if !preferences.watchingCountries.isEmpty {
                Section(header: Text("Watching Countries")) {
                    WatchingCountriesSummaryCardViews(
                        watchingCountries: $preferences.watchingCountries,
                        countrySummaries: state.countries
                    )
                }
            }
//            Divider()
            Button(action: {
                self.showSafari = true
            }, label: {
                Text("Powered by covid19api.com")
            })
        } 
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
        .onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
        .sheet(isPresented: $showSafari) {
            return Covid19ApiSafariView(url: URL(string: "https://www.covid19api.com/")!)
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    struct BindingPreview: View {
        @State var showSafari = false
        var body: some View {
            HomeList(
                state: AppState(),
                preferences: AppPreferences(),
                showSafari: $showSafari
            )
        }
    }
    static var previews: some View {
        BindingPreview()
    }
}
