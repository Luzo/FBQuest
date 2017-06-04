//
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import Swinject

class ViewControllerAssembly: Assembly {

    func assemble(container: Container) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)

        container.register(MenuViewController.self) { _ in
            mainStoryboard.instantiateViewController(
                withIdentifier: String(describing: MenuViewController.self)
            ) as! MenuViewController
        }.initCompleted { (r, menuVC) in
            menuVC.ininitialize(
                datasource: MenuDataSource(),
                presenter: r.resolve(MenuPresenter.self)!
            )
        }

        container.register(SlidesViewController.self) { _ in
            mainStoryboard.instantiateViewController(
                withIdentifier: String(describing: SlidesViewController.self)
            ) as! SlidesViewController
        }.initCompleted { (r, slidesVC) in
            slidesVC.ininitialize(
                presenter: r.resolve(SlidesPresenter.self)!
            )
        }

        container.register(QuestionsViewController.self) { _ in
            mainStoryboard.instantiateViewController(
                withIdentifier: String(describing: QuestionsViewController.self)
            ) as! QuestionsViewController
        }.initCompleted { (r, questionsVC) in
            questionsVC.ininitialize(
                presenter: r.resolve(QuestionsPresenter.self)!
            )
        }

        container.register(DoneViewController.self) { _ in
            mainStoryboard.instantiateViewController(
                withIdentifier: String(describing: DoneViewController.self)
                ) as! DoneViewController
            }.initCompleted { (r, doneVC) in
                doneVC.ininitialize(
                    presenter: r.resolve(DonePresenter.self)!
                )
        }
    }
}

