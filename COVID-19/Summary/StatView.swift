//
//  StatView.swift
//  COVID-19
//
//  Created by Brianna Lee on 4/19/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI

struct Stats {
    var title: String
    var stats: [Stat]
}

struct Stat {
    var label: String
    var value: String
}

struct StatsView: View {
    
    @State var title: String
    @State var new: Int
    @State var total: Int
    @State var backgroundColor: Color
    @State var textColor: Color
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 18))
                    .fontWeight(.black).lineLimit(nil)
                VStack (alignment: .leading) {
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("New: ").fontWeight(.black).lineLimit(nil)
                        Text("\(new)").bold().lineLimit(nil)
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("Total: ").fontWeight(.black).lineLimit(nil)
                        Text("\(total)").bold().lineLimit(nil)
                    }
                }
            }
        }
        .padding()
        .frame(alignment: .topLeading)
        .background(backgroundColor)
        .cornerRadius(10)
        .foregroundColor(textColor)
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalSummaryCardView(globalSummary: GlobalSummary.demo)
    }
}
