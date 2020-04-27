//
//  GlobalSummaryView.swift
//  COVID-19
//
//  Created by Brianna Lee on 4/19/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct SummaryCardView: View {
    
    var direction: Axis.Set
    var title: String
    var summary: SummaryObject
    
    var body: some View {
        VStack {
            HStack {
                Text(title).font(.system(size: 40)).fontWeight(.black)
            }
            StatView(
                title: "Confirmed",
                new: summary.newConfirmed,
                total: summary.totalConfirmed,
                backgroundColor: Color.yellow,
                textColor: Color.black
            )
            StatView(
                title: "Recovered",
                new: summary.newConfirmed,
                total: summary.totalConfirmed,
                backgroundColor: Color.green,
                textColor: Color.white
            )
            StatView(
                title: "Deaths",
                new: summary.newConfirmed,
                total: summary.totalConfirmed,
                backgroundColor: Color.red,
                textColor: Color.white
            )
        }.padding()
    }
}

struct SummaryScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryCardView(
            direction: .horizontal,
            title: "Global",
            summary: GlobalSummary(
                newConfirmed: 0,
                totalConfirmed: 0,
                newDeaths: 0,
                totalDeaths: 0,
                newRecovered: 0,
                totalRecovered: 0
            )
        )
    }
}
