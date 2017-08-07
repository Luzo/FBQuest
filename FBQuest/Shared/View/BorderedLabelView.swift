//
//  BorderedLabelView.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/07/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

@IBDesignable
class BorderedLabelView: UILabel {

    @IBInspectable var fullCircle: Bool = false {
        didSet { layer.cornerRadius = fullCircle ? self.frame.height/2 : cornerRadius }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet { layer.cornerRadius = cornerRadius }
    }

    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet { layer.borderWidth = borderWidth }
    }

    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
            textColor = borderColor
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
        layer.cornerRadius = fullCircle ? self.frame.height/2 : cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        textColor = borderColor
    }
}
