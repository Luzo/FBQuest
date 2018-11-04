//
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

class BaseViewController<PresenterType>: UIViewController {

    var presenter: PresenterType? {
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
        setupViewLayout()
    }

    func setupViewLayout() {
        view.backgroundColor = Colors.Background
        UINavigationBar.appearance().backgroundColor = Colors.NavigationBar
        UINavigationBar.appearance().barTintColor = Colors.NavigationBar

        setTitleView()
        setNavigationBarElementsColors()
        setBackButton()
    }

    fileprivate func setNavigationBarElementsColors() {
        UINavigationBar.appearance().tintColor = .white
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).setTitleTextAttributes(
            [
                NSFontAttributeName : Fonts.TextFontLight,
                NSForegroundColorAttributeName: UIColor.clear
            ],
            for: .normal
        )

        UIApplication.shared.statusBarStyle = .lightContent
    }

    fileprivate func setBackButton() {
        let backArrowImage = UIImage(named: "back")?.image(atSize: CGSize(width: 25, height: 25))
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysTemplate)
        UINavigationBar.appearance().backIndicatorImage = renderedImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = renderedImage
    }

    fileprivate func setTitleView() {
        //need to be in wrapper, otherwise title is not centered
        let frame = CGRect(x: 0, y: 10, width: 200, height: 64)
        let view = UIView(frame: frame)
        let titleView = UIImageView(frame: frame)
        titleView.contentMode = .scaleAspectFit
        titleView.image = UIImage(named:"logo")
//        titleView.autoresizingMask = .flexibleHeight

        view.addSubview(titleView)
        view.clipsToBounds = true
        
        navigationItem.titleView = view
    }

    override func viewWillAppear(_ animated: Bool) {
        _presenter.setupAfterInit()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)

        self.navigationItem.title = " "
    }
}

