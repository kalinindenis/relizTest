//
//  PresentationController.swift
//  RelizTestKalininD
//
//  Created by Денис on 22/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let bounds = containerView!.bounds
        let height = bounds.height / 2
        let width = bounds.width * 0.8
        let gapX = (bounds.width - width)/2
        let liftingY = bounds.height * 0.25
        return CGRect(x: gapX,
                      y: liftingY,
                      width: width,
                      height: height)
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        containerView?.addSubview(presentedView!)
    }
    
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
}
