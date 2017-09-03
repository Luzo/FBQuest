//
//  SlidesViewController.swift
//  FBQuest
//
//  Created by Lubos Lehota on 28/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//


import UIKit

final class SlidesViewController: BaseViewController<SlidesPresenter> {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var contentHolder: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var topicImageView: UIImageView!
    @IBOutlet weak var titleToDescriptionConstraint: NSLayoutConstraint!

    deinit {
        print("dealloc \(self)")

    }

    override func viewDidLoad() {
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        shareButton.setTitleColor(.darkGray, for: .highlighted)
        shareButton.setTitleColor(.clear, for: .selected)
        nextButton.setTitleColor(.darkGray, for: .highlighted)
        nextButton.setTitleColor(.clear, for: .selected)
        titleLabel.font = Fonts.H1Font
        descriptionLabel.font = Fonts.TextFont
    }

    func didTapNextButton() {
        presenter?.nexSlideButtonSelected()
    }

    func didTapShareButton() {
        presenter?.shareButtonSelected()
    }

    func takeScreenShot() -> UIImage? {
        UIGraphicsBeginImageContext(view.frame.size)
        guard let currentContext = UIGraphicsGetCurrentContext() else { return nil }

        view.layer.render(in: currentContext)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }

    func presentShareViewController(forItems items: [AnyObject]) {
        let activityViewController = UIActivityViewController(
            activityItems: items, applicationActivities: nil
        )
        activityViewController.popoverPresentationController?.sourceView = self.view
        present(activityViewController, animated: true, completion: nil)
    }
}

extension SlidesViewController: SlidesView {
    func setupView(withTopicSlide topicSlide: TopicSlide) {
        titleLabel?.text = topicSlide.title
        descriptionLabel?.text = topicSlide.description
        topicImageView?.image = topicSlide.image.flatMap { UIImage(named: $0) }
        topicImageView?.isHidden = topicSlide.image == nil
        titleToDescriptionConstraint?.priority = topicSlide.image == nil ? 999 : 1
    }
}
