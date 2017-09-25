//
//  DoneViewController.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit
import SAConfettiView

final class DoneViewController: BaseViewController<DonePresenter> {

    @IBOutlet weak var contentHolder: UIView!
    @IBOutlet var confettiView: SAConfettiView!
    @IBOutlet weak var titleLabel: UILabel!

    deinit {
        print("dealloc \(self)")
    }

    override func setupViewLayout() {
        super.setupViewLayout()
        view.backgroundColor = Colors.ModalOverContext
        titleLabel.font = Fonts.H1Font
        confettiView.startConfetti()
    }

    @IBAction func didTapOnDoneButton(_ sender: UIButton) {
        presenter?.doneButtonTapped()
    }
}

extension DoneViewController: DoneView {}
