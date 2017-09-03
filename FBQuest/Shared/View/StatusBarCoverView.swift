//
//  StatusBarCoverView.swift
//  FBQuest
//
//  Created by Lubos Lehota on 26/08/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

@IBDesignable
class StatusBarCoverView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setAppearence()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setAppearence()
    }

    fileprivate func setAppearence() {
        backgroundColor = Colors.NavigationBar
    }
}


