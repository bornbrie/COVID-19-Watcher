//
//  CountrySummaryList.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct CountrySummaryList: View {
    @ObservedObject var state: AppState
    @ObservedObject var preferences: AppPreferences
    @Binding var query: String
    #if !os(watchOS)
    var body: some View {
        List {
            SearchBar(query: $query)
            CountrySummaryCardViews(
                state: state,
                preferences: preferences,
                query: $query
            )
        }
        .navigationBarTitle(Text("All Countries"))
    }
    #else
    var body: some View {
        List {
            CountrySummaryCardViews(
                state: state,
                preferences: preferences,
                query: $query
            )
        }
    }
    #endif
}

struct CountrySummaryList_Previews: PreviewProvider {
    
    struct NoSearch: View {
        
        @ObservedObject var state = AppState()
        @ObservedObject var preferences = AppPreferences()
        @State var query = ""
        
        var body: some View {
            CountrySummaryList(
                state: state,
                preferences: preferences,
                query: $query
            )
        }
    }
    
    struct WithSearch: View {
        
        @ObservedObject var state = AppState()
        @ObservedObject var preferences = AppPreferences()
        @State var query = ""
        
        var body: some View {
            CountrySummaryList(
                state: state,
                preferences: preferences,
                query: $query
            )
        }
    }
    static var previews: some View {
        Group {
            NoSearch()
            WithSearch()
        }
    }
}
