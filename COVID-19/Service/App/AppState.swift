//
//  SummaryFetcher.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/18/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import Foundation
#if os(iOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

public class AppState: ObservableObject, Fetcher {
    
    #if os(watchOS)
    static var shared = AppState()
    #endif
    
    var baseUrl = URL(string: "https://api.covid19api.com/")!
    
    @Published var worldTotals = WorldTotal.empty
    @Published var globalSummary = GlobalSummary.empty
    @Published var countries: [CountrySummary] = []
    @Published var date: String = ""
    @Published var loading = false
    @Published var countrySearchQuery: String = ""
    
    private let watchingCountriesKey = "watchingCountries"
    private var summaryResponse: Summary?
    
    init() {
        loading = true

        fetchSummary() { summary, error in
            if let error = error {
                self.loading = false
                throw error
            }
            guard let summary = summary else {
                self.loading = false
                throw FetcherError.noData(message: "SummaryResponse object is unexpectedly nil")
            }
            self.set(summary)
            self.loading = false
        }
    }
    
    private func demoSummary() -> Summary {
        guard let path = Bundle.main.path(forResource: "summaryDemo", ofType: "json") else {
            fatalError("Failed to init bundle resource path")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let summary = try JSONDecoder().decode(Summary.self, from: data)
            return summary
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    private func set(_ summary: Summary) {
        self.globalSummary = summary.global
        self.countries = summary.countries
        self.date = summary.date
    }
}

extension AppState {
    
    func fetchSummary(then complete: @escaping FetcherCompletionHandler<Summary>) {
        fetch("summary", then: complete)
    }
    
    func fetchWorldTotals(then complete: @escaping FetcherCompletionHandler<WorldTotal>) {
        fetch("world/total", then: complete)
    }
}
