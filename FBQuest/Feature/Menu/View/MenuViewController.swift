//
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit
import pop

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

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let fadeAnimation = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        fadeAnimation?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        fadeAnimation?.fromValue = 0
        fadeAnimation?.duration = 1

        cell.contentView.pop_add(fadeAnimation, forKey: "fadeIn")

        let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
        scaleAnimation?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)

        scaleAnimation?.fromValue = CGSize(width: 5, height: 5)
        scaleAnimation?.duration = 1

        cell.contentView.pop_add(scaleAnimation, forKey: "scaleXY")
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
