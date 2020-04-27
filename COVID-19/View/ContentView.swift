//
//  ContentView.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/19/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var preferences = AppPreferences()
    @ObservedObject var state = AppState()
    var body: some View {
        HomeView(state: state, preferences: preferences)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
