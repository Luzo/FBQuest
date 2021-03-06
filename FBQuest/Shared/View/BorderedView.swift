//
//  BorderedView.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

@IBDesignable
class BorderedView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet { layer.cornerRadius = cornerRadius }
    }

    @IBInspectable var borderWidth: CGFloat = 0.5 {
        didSet { layer.borderWidth = borderWidth }
    }

    @IBInspectable var borderColor: UIColor = .black {
        didSet { layer.borderColor = borderColor.cgColor }
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
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
