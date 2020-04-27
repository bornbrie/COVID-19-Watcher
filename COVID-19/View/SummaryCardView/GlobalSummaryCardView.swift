//
//  GlobalSummaryCardView.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct GlobalSummaryCardView: View {
    var globalSummary: GlobalSummary
    var title = "Global"
    var body: some View {
        SummaryCardView<GlobalSummary>(
            title: title,
            summary: globalSummary
        )
    }
}

struct GlobalSummaryCardView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalSummaryCardView(globalSummary: AppState().globalSummary)
    }
}
