//
//  SummaryView.swift
//  COVID-19
//
//  Created by Brianna Zamora on 3/22/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var state: AppState
    @ObservedObject var preferences: AppPreferences
    @State var showSafari = false
    var body: some View {
            HomeList(state: state, preferences: preferences, showSafari: $showSafari)
            .navigationBarTitle("Overview")
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView(state: AppState(), preferences: AppPreferences())
            HomeView(state: AppState(), preferences: AppPreferences())
                .colorScheme(.dark)
        }
    }
}
