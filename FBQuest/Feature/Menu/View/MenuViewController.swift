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

        super.ininitialize(presenter: presenter)
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
        table.sectionHeaderHeight = 0
    }

    //MARK: TABLEVIEW DELEGATE - cannot be implemented in generic class extension
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.topicSelected(atIndex: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
}

extension MenuViewController: MenuView {
    //TODO: rework with viewModel
    func setWithTopics(topics: [Topic]) {
        datasource.menuItems = topics
        table.reloadData()
    }
}

extension MenuViewController: UITableViewDelegate {}
