//
//  MenuItemTableCell.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

final class MenuItemTableCell: UITableViewCell {

    @IBOutlet weak var contentHolder: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!

    func setupAppearence() {
        backgroundColor = .clear
    }

    func setTitle(title: String?) {
        nameLabel.text = title
    }

    func setImage(image: String?) {
        cellImageView.image = image.flatMap { UIImage(named: $0) }
    }
}
