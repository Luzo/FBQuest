//
//  View.swift
//  FBQuest
//
//  Created by Lubos Lehota on 30/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

protocol View: AnyObject {
    var navigationViewController: UINavigationController? { get }
}

extension View where Self: UIViewController {
    var navigationViewController: UINavigationController? { return navigationController }
}
