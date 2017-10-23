//
//  SlidesViewController.swift
//  FBQuest
//
//  Created by Lubos Lehota on 28/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//


import UIKit
import pop

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

    fileprivate var canAnimateTransition: Bool = false

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

    override func viewDidDisappear(_ animated: Bool) {
        canAnimateTransition = false
    }

    override func viewDidAppear(_ animated: Bool) {
        canAnimateTransition = true
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

    fileprivate func animateSlideOut() {
        guard canAnimateTransition else { return }

        let originalCenter = CGPoint(x: contentHolder.center.x, y: contentHolder.center.y)
        let screenWidth = UIScreen.main.bounds.width

        let copyView = contentHolder.imageCopy
        let shadowedView = ShadowedView(frame: contentHolder.frame)
        view.addSubview(shadowedView)
        shadowedView.addSubview(copyView)

        let slideOutAnimation = POPBasicAnimation(propertyNamed: kPOPViewCenter)
        slideOutAnimation?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        slideOutAnimation?.toValue = CGPoint(x: -screenWidth, y: originalCenter.y)
        slideOutAnimation?.duration = 1
        slideOutAnimation?.completionBlock = { animation, completed in
            shadowedView.removeFromSuperview()
        }

        shadowedView.pop_add(slideOutAnimation, forKey: "slideOut")
    }

    fileprivate func animateSlideIn() {
        guard canAnimateTransition else { return }

        let originalCenter = CGPoint(x: contentHolder.center.x, y: contentHolder.center.y)
        let screenWidth = UIScreen.main.bounds.width

        let copyView = contentHolder.imageCopy
        let shadowedView = ShadowedView(frame: contentHolder.frame)
        view.addSubview(shadowedView)
        shadowedView.addSubview(copyView)

        shadowedView.center.x = 2 * screenWidth
        contentHolder.isHidden = true

        let slideInAnimation = POPBasicAnimation(propertyNamed: kPOPViewCenter)
        slideInAnimation?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        slideInAnimation?.toValue = originalCenter
        slideInAnimation?.duration = 1
        slideInAnimation?.completionBlock = { [unowned self] animation, completed in
            shadowedView.removeFromSuperview()
            self.contentHolder.isHidden = false
        }

        shadowedView.pop_add(slideInAnimation, forKey: "slideIn")
    }
}

extension SlidesViewController: SlidesView {

    func setupView(withTopicSlide topicSlide: TopicSlide) {
        animateSlideOut()

        titleLabel?.text = topicSlide.title
        descriptionLabel?.text = topicSlide.description
        topicImageView?.image = topicSlide.image.flatMap { UIImage(named: $0) }
        topicImageView?.isHidden = topicSlide.image == nil
        titleToDescriptionConstraint?.priority = topicSlide.image == nil ? 999 : 1

        animateSlideIn()
    }
}
