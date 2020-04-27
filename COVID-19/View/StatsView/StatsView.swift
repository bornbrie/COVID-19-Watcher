//
//  StatView.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/19/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct StatsView: View {
    
    @State var stats: Stats
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                if stats.title != nil {
                    TitleLabel(title: stats.title ?? "")
                }
                VStack (alignment: .leading, spacing: 8) {
                    Divider()
                    ForEach(stats.metrics) { metric in
                        VStack(alignment: .leading) {
                            if metric.label != nil {
                                StatLabel(
                                    text: metric.label ?? "" + ": ",
                                    alignment: .bottomLeading,
                                    fontWeight: .medium
                                )
                            }
                            StatLabel(
                                text: metric.value,
                                alignment: .topLeading,
                                fontWeight: .bold
                            )
                        }
                    }.frame(minWidth: .none, maxWidth: .infinity, minHeight: .none, maxHeight: .infinity)
                }.frame(minWidth: .none, maxWidth: .infinity, minHeight: .none, maxHeight: .infinity)
            }
        }
        .padding()
        .background(stats.backgroundColor)
        .cornerRadius(10)
        .foregroundColor(stats.textColor)
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            GlobalSummaryCardView(globalSummary: GlobalSummary.demo)
        }
    }
}

struct StatLabel: View {
    var text: String
    var alignment: Alignment = .topLeading
    var fontWeight: Font.Weight = .regular
    var body: some View {
        Text(text)
            .fontWeight(fontWeight)
            .lineLimit(nil)
            .frame(
                minWidth: .none,
                maxWidth: .infinity,
                minHeight: .none,
                maxHeight: .infinity,
                alignment: alignment
        )
    }
}

struct TitleLabel: View {
    var title: String
    var fontSize: CGFloat = 18
    var fontWeight: Font.Weight = .black
    var body: some View {
        Text(title)
            .font(.system(size: fontSize))
            .fontWeight(fontWeight)
            .lineLimit(nil)
    }
}
