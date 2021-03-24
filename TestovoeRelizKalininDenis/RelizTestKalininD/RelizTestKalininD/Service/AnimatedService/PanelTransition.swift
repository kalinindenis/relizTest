//
//  PanelTransition.swift
//  RelizTestKalininD
//
//  Created by Денис on 22/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import UIKit

class PanelTransition: NSObject, UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimation()
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimation()
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        //  засунуть DimmPresentationController     PresentationController
        let presentationController = DimmPresentationController(presentedViewController: presented,
                                                            presenting: presenting ?? source)
        
        return presentationController
    }
}
