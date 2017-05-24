//
//  AppDelegate.swift
//  FBQuest
//
//  Created by Lubos Lehota on 14/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppPresenter: UIResponder {
    var window: UIWindow?
    let appRouter = AppRouter.instance

    fileprivate func setWindowAndRootController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .black
        window?.makeKeyAndVisible()

        let menuVC = self.appRouter.appScope.resolve(type: MenuViewController.self)
        window?.rootViewController = menuVC
    }
}

extension AppPresenter: UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {

        setWindowAndRootController()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

