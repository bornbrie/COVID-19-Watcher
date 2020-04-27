//
//  WorldTotal.swift
//  COVID-19
//
//  Created by Brianna Lee on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import Foundation

struct WorldTotal: TotalCasesObject {
    var id = UUID().uuidString
    var totalConfirmed: Int
    var totalDeaths: Int
    var totalRecovered: Int
    enum CodingKeys: String, CodingKey {
        case totalConfirmed = "TotalConfirmed"
        case totalDeaths = "TotalDeaths"
        case totalRecovered = "TotalRecovered"
    }
    static var empty = WorldTotal(totalConfirmed: 0, totalDeaths: 0, totalRecovered: 0)
}
