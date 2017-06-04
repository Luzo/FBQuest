//
//  SlidesInteractor.swift
//  FBQuest
//
//  Created by Lubos Lehota on 28/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

protocol SlidesInteractor: AnyObject {
    var mappedSlides: [Int: [TopicSlide]] { get }
}

final class SlidesInteractorImpl: BaseInteractor {

    fileprivate let topicSlidesResource: TopicSlidesResource
    fileprivate let slidesConverter: SlidesConverter
    private (set) var mappedSlides: [Int: [TopicSlide]] = [:]

    deinit {
        print("Deinited \(self)")
    }

    init(
        topicSlidesResource: TopicSlidesResource,
        slidesConverter: SlidesConverter
    ) {
        self.topicSlidesResource = topicSlidesResource
        self.slidesConverter = slidesConverter

        super.init()

        requestResource()
    }

    fileprivate func requestResource() {
        topicSlidesResource.makeRequest(input: "TopicSlides") { (result) in
            switch result {
            case .success(let list):
                mappedSlides = slidesConverter.convert(input: list)
            case .failure( _): break
            }
        }
    }
}

extension SlidesInteractorImpl: SlidesInteractor {

}
