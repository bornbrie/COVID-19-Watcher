//
//  Covid19ApiSafariView.swift
//  COVID-19
//
//  Created by Brianna Lee on 4/26/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import UIKit
import SafariServices

final class Covid19ApiSafariView: UIViewController {
    var url: URL? {
        didSet {
            // when url changes, reset the safari child view controller
            configureChildViewController()
        }
    }

    private var safariViewController: SFSafariViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureChildViewController()
    }

    private func configureChildViewController() {
        // Remove the previous safari child view controller if not nil
        if let safariViewController = safariViewController {
            safariViewController.willMove(toParent: self)
            safariViewController.view.removeFromSuperview()
            safariViewController.removeFromParent()
            self.safariViewController = nil
        }

        guard let url = url else { return }

        // Create a new safari child view controller with the url
        let newSafariViewController = SFSafariViewController(url: url)
        addChild(newSafariViewController)
        newSafariViewController.view.frame = view.frame
        view.addSubview(newSafariViewController.view)
        newSafariViewController.didMove(toParent: self)
        self.safariViewController = newSafariViewController
    }
}
