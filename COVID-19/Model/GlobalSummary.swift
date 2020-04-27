//
//  GlobalSummary.swift
//  COVID-19
//
//  Created by Brianna Lee on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import Foundation

struct GlobalSummary: SummaryObject {
    
    var id = UUID().uuidString
    var newConfirmed: Int
    var totalConfirmed: Int
    var newDeaths: Int
    var totalDeaths: Int
    var newRecovered: Int
    var totalRecovered: Int
    
    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
}

extension GlobalSummary {
    static var demo = AppState().globalSummary
    static var empty = GlobalSummary(
        newConfirmed: 0,
        totalConfirmed: 0,
        newDeaths: 0,
        totalDeaths: 0,
        newRecovered: 0,
        totalRecovered: 0
    )
}
