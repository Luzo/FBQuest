//
//  Copyright © 2017 LubosLehota. All rights reserved.
//

class BasePresenter<ViewType>: Presenter{
    let appRouter: AppRouter
    var view: ViewType {
        get {
            guard let castedPresenter = _view as? ViewType else {
                fatalError("BasePresenter's associated type must be of type \(ViewType.self))")
            }

            return castedPresenter
        }
        set {
            guard let castedView = newValue as? View else {
                fatalError("BasePresenter's associated type must be of type \(View.self))")
            }

            _view = castedView
        }
    }
    private var _view: View!

    init(appRouter: AppRouter, view: ViewType) {
        self.appRouter = appRouter
        self.view = view
    }

    func setupAfterInit() {}

}

protocol Presenter {
    func setupAfterInit()
}

protocol View {}
