//
//  Covid19Summary.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/18/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import Foundation

struct Summary: Codable {
    var stats: [StatMetric] = []
    var global: GlobalSummary
    var countries: [CountrySummary]
    var date: String
    enum CodingKeys: String, CodingKey {
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
}

protocol SummaryObject: TotalCasesObject, NewCasesObject{
    var id: String { get }
}

protocol TotalCasesObject: Codable, Identifiable {
    var totalConfirmed: Int { get }
    var totalDeaths: Int { get }
    var totalRecovered: Int { get }
}

protocol NewCasesObject: Codable, Identifiable {
    var newConfirmed: Int { get }
    var newDeaths: Int { get }
    var newRecovered: Int { get }
}
