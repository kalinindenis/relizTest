//
//  Router.swift
//  RelizTestKalininD
//
//  Created by Денис on 18/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import UIKit

protocol RouterProtocol {
    func rootView (view: UIViewController)
    func pushView (view: UIViewController)
    func popView (view: UIViewController)
}

final class Router: RouterProtocol {
    var navigationController = UINavigationController()
    
    public func rootView(view: UIViewController) {
        navigationController = UINavigationController(rootViewController: view)
        print (navigationController.viewControllers)
    }
    
    public func pushView(view: UIViewController) {
        navigationController.pushViewController(view, animated: false)
    }
    
    public func popView(view: UIViewController) {
        navigationController.popViewController(animated: false)
    }
}
