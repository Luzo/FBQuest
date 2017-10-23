//
//  UIView+Extension.swift
//  FBQuest
//
//  Created by Lubos Lehota on 30/09/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

extension UIView {
    var imageCopy: UIView {
        UIGraphicsBeginImageContext(frame.size)
        guard let currentContext = UIGraphicsGetCurrentContext() else { return UIView() }

        layer.render(in: currentContext)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return UIImageView(image: image)
    }
}
