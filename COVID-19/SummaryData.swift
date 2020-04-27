//
//  Covid19Summary.swift
//  COVID-19
//
//  Created by Brianna Lee on 4/18/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import Foundation

struct Summary: Codable {
    public var global: GlobalSummaryData
    public var countries: [CountrySummaryData]
    public var date: String
    enum CodingKeys: String, CodingKey {
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
}

struct GlobalSummaryData: Codable {
    public var newConfirmed: Int
    public var totalConfirmed: Int
    public var newDeaths: Int
    public var totalDeaths: Int
    public var newRecovered: Int
    public var totalRecovered: Int
    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
}

struct CountrySummaryData: Codable {
    public var expanded = false
    public var country: String
    public var countryCode: String
    public var slug: String
    public var newConfirmed: Int
    public var totalConfirmed: Int
    public var newDeaths: Int
    public var totalDeaths: Int
    public var newRecovered: Int
    public var totalRecovered: Int
    public var date: String
    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case date = "Date"
    }
}
