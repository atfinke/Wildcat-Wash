//
//  AppDelegate.swift
//  NU Laundry
//
//  Created by Andrew Finke on 9/28/17.
//  Copyright © 2017 Andrew Finke. All rights reserved.
//

import UIKit
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        guard let url = Bundle.main.url(forResource: "fabric.apikey", withExtension: nil),
            let key = try? String(contentsOf: url) else {
                fatalError()
        }
        Crashlytics.start(withAPIKey: key.replacingOccurrences(of: "\n", with: ""))

        guard let splitViewController = window?.rootViewController as? UISplitViewController else {
            fatalError()
        }
        splitViewController.delegate = self
        splitViewController.preferredDisplayMode = .allVisible

        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = UIColor(red: 73.0/255.0,
                                                            green: 46.0/255.0,
                                                            blue: 127.0/255.0,
                                                            alpha: 1.0)

        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [
            NSAttributedStringKey.foregroundColor.rawValue: UIColor.white
        ]

        if #available(iOS 11.0, *) {
            UINavigationBar.appearance().largeTitleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
        }

        return true
    }

    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        return true
    }

}

extension UIColor {

    static var postive: UIColor {
        return UIColor(displayP3Red: 67.0/255.0,
                       green: 144.0/255.0,
                       blue: 78.0/255.0,
                       alpha: 1.0)
    }

    static var negative: UIColor {
        return UIColor(displayP3Red: 230.0/255.0,
                       green: 50.0/255.0,
                       blue: 35.0/255.0,
                       alpha: 1.0)
    }

}
