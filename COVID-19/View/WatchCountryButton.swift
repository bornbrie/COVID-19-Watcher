//
//  WatchCountryButton.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/25/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct WatchCountryButton: View {
    @Binding var watchingCountries: [String]
    var slug: String
    var body: some View {
        Button(action: {
            self.toggleWatching(slug: self.slug)
        }) {
            if self.isWatching(slug) {
                Text("Stop Watching")
            } else {
                Text("Watch Country")
            }
        }
    }
    func isWatching(_ slug: String) -> Bool {
        return watchingCountries.contains(self.slug)
    }
    func toggleWatching(slug: String) {
        if isWatching(slug) {
            watchingCountries.removeAll { $0 == slug }
        } else {
            watchingCountries.append(slug)
        }
    }
}

struct WatchCountryButton_Previews: PreviewProvider {
    
    struct IsWatching: View {
        @State var watchingCountries = ["united-states-of-america"]
        var slug = "united-states-of-america"
        var body: some View {
            WatchCountryButton(
                watchingCountries: $watchingCountries,
                slug: slug
            )
        }
    }
    
    struct IsNotWatching: View {
        @State var watchingCountries: [String] = []
        var slug = "united-states-of-america"
        var body: some View {
            WatchCountryButton(
                watchingCountries: $watchingCountries,
                slug: slug
            )
        }
    }
    
    static var previews: some View {
        Group {
            IsWatching()
            IsNotWatching()
        }
    }
}
