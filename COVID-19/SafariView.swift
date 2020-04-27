//
//  SafariView.swift
//  COVID-19
//
//  Created by Brianna Lee on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import SwiftUI
import SafariServices

struct Covid19ApiSafariView: UIViewControllerRepresentable {
    let url: URL
    func makeUIViewController(context: Context) -> some UIViewController {
        return SFSafariViewController(url: url)
    }
    func updateUIViewController(_ uiViewController: some UIViewController, context: Context) {
        
    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        Covid19ApiSafariView(url: URL(string: "https://www.covid19api.com/")!)
    }
}
