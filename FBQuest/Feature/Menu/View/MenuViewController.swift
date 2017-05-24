//
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

final class MenuViewController: BaseViewController<MenuPresenter> {

    @IBOutlet weak var table: UITableView!
    var datasource: MenuDataSource!
    let menuItemCellIdentifier = String(describing: MenuItemTableCell.self)

    func ininitialize(
        datasource: MenuDataSource,
        presenter: MenuPresenter
    ) {
        self.datasource = datasource
        self.presenter = presenter
    }

    override func viewDidLoad() {
        setupTableView()
    }

    private func setupTableView() {
        table.delegate = self
        table.dataSource = datasource
        table.register(UINib.init(nibName: menuItemCellIdentifier, bundle: nil), forCellReuseIdentifier: menuItemCellIdentifier)
        table.separatorStyle = .none
        table.rowHeight = UITableViewAutomaticDimension
        table.estimatedRowHeight = 40
    }

    //MARK: TABLEVIEW DELEGATE - cannot be implemented in generic class extension
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.topicSelected(atIndex: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension MenuViewController: MenuView {
    func setWithTitles(titles: [String]) {
        datasource.menuItems = titles
        table.reloadData()
    }
}

extension MenuViewController: UITableViewDelegate {}
