//
//  Covid19ApiSafariView.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import UIKit
import SafariServices
import SwiftUI

struct Covid19ApiSafariView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = SFSafariViewController
    
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}
