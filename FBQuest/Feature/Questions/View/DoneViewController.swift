//
//  DoneViewController.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

final class DoneViewController: BaseViewController<DonePresenter> {

    @IBOutlet weak var contentHolder: UIView!

    deinit {
        print("dealloc \(self)")
    }

    override func viewDidLoad() {
        contentHolder.layer.shadowColor = UIColor.black.cgColor
        contentHolder.layer.shadowOffset = CGSize(width: 2, height: 2)
        contentHolder.layer.shadowOpacity = 0.8
    }

    @IBAction func didTapOnDoneButton(_ sender: UIButton) {
        presenter?.doneButtonTapped()
    }
}

extension DoneViewController: DoneView {}
