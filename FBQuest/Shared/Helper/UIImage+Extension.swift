//
//  UIImage+Extension.swift
//  FBQuest
//
//  Created by Lubos Lehota on 15/09/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

extension UIImage {
    func image(atSize size: CGSize) -> UIImage? {

        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen

        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        draw(in: CGRect(origin: .zero, size: size))

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
}
