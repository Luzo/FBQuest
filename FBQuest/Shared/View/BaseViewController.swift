//
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

class BaseViewController<PresenterType>: UIViewController {

    var presenter: PresenterType {
        get {
            guard let castedPresenter = _presenter as? PresenterType else {
                fatalError("BaseViewController's associated type must be of type \(Presenter.self))")
            }

            return castedPresenter
        }
        set {
            guard let castedPresenter = newValue as? Presenter else {
                fatalError("BaseViewController's associated type must be of type \(Presenter.self))")
            }

            _presenter = castedPresenter
        }
    }
    private var _presenter: Presenter!

    func ininitialize(presenter: PresenterType) {
        self.presenter = presenter
    }

    override func viewWillAppear(_ animated: Bool) {
        _presenter.setupAfterInit()
    }
}
