//
//  CountrySummary.swift
//  COVID-19
//
//  Created by Brianna Lee on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import Foundation

struct CountrySummary: SummaryObject {
    
    var id = UUID().uuidString
    var newConfirmed: Int
    var totalConfirmed: Int
    var newDeaths: Int
    var totalDeaths: Int
    var newRecovered: Int
    var totalRecovered: Int
    var country: String
    var countryCode: String
    var slug: String
    var date: String
    
    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case date = "Date"
    }
    
    static var demo = AppState().countries.randomElement() ?? CountrySummary(
        newConfirmed: 35972,
        totalConfirmed: 904317,
        newDeaths: 1995,
        totalDeaths: 51921,
        newRecovered: 18876,
        totalRecovered: 99079,
        country: "United States of America",
        countryCode: "US",
        slug: "united-states-of-america",
        date: "2020-04-25T23:11:16Z"
    )
}
