//
//  SummaryHostingController.swift
//  CovidWatcher WatchKit Extension
//
//  Created by Brianna Lee on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class SummaryHostingController: WKHostingController<WatchSummaryView> {
    
    var state = AppState()
    
    override var body: WatchSummaryView {
        return WatchSummaryView(state: state)
    }
}
