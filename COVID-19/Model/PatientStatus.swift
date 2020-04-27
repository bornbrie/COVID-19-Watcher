//
//  PatientStatus.swift
//  COVID-19
//
//  Created by Brianna Zamora on 3/22/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import Foundation

enum PatientStatus: String {
    case confirmed = "confirmed"
    case recovered = "recovered"
    case deaths = "deaths"
    var name: String {
        return self.rawValue.localizedCapitalized
    }
}
