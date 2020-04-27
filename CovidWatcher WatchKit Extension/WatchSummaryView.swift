//
//  WatchSummaryView.swift
//  CovidWatcher WatchKit Extension
//
//  Created by Brianna Lee on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct WatchSummaryView: View {
    @ObservedObject var state: AppState
    var body: some View {
        ScrollView {
            TitleLabel(
                title: "Summary",
                fontSize: 24,
                fontWeight: .heavy
            )
            Divider()
            GlobalSummaryCardView(
                globalSummary: state.globalSummary
            )
            Divider()
            LastUpdatedView(date: $state.date)
        }
    }
}

struct WatchSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        WatchSummaryView(state: AppState())
    }
}
