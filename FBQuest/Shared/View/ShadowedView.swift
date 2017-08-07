//
//  ShadowedView.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/07/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowedView: UIView {

    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 2, height: 2) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    @IBInspectable var shadowOpacity: Float = 0.3 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setAppearence()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setAppearence()
    }

    fileprivate func setAppearence() {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
    }
}


