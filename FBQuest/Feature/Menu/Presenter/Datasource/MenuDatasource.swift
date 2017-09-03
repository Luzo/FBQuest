//
//  MenuDatasource.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

class MenuDataSource: NSObject, UITableViewDataSource {
    let menuItemCellIdentifier = String(describing: MenuItemTableCell.self)
    var menuItems: [Topic] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuItemCellIdentifier, for: indexPath)
        let menuItemCell = cell as? MenuItemTableCell
        menuItemCell?.setupAppearence()
        let item = menuItems[indexPath.row]
        menuItemCell?.setTitle(title: item.name)
        menuItemCell?.setImage(image: item.image)

        return cell
    }
}
