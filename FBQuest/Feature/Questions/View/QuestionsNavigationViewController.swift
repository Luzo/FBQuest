//
//  QuestionsNavigationViewController.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

protocol DismissableNavigation {
    func dismissNavigation()
}

final class QuestionsNavigationViewController: UINavigationController {
    let appRouter = AppRouter.instance
    var appEventsNotifier: AppEventsNotifier {
        return appRouter.appScope.resolve(type: AppEventsNotifier.self)
    }
    fileprivate var observers = [Any]()

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        observers = [observeDismissToMenu()]
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        observers = [observeDismissToMenu()]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func observeDismissToMenu() -> Any {
        return appEventsNotifier.dismissQuestionsToMenuEvent.observe { [weak self] in
            self?.dismiss(animated: false, completion: { [weak self] in
                self?.appEventsNotifier.dismissToMenuEvent.fire()
            })
        }
    }
}

extension QuestionsNavigationViewController: DismissableNavigation {
    func dismissNavigation() {
        self.popViewController(animated: false)
    }
}
