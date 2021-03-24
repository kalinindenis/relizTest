//
//  Coordinator.swift
//  RelizTestKalininD
//
//  Created by Денис on 18/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol: class {
    
    func openConverter()
    func openListCurrency(parentView: ConverterViewProtocol, transition: UIViewControllerTransitioningDelegate, saveLocalData: SaveLocalDataProtocol, logicConverter: LogicConverterProtocol, sendGet: SendGetButton)
}

final class Coordinator: CoordinatorProtocol {
    
    private var router: RouterProtocol!
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    public func openConverter() {
        let view = ConverterBuilder.createConverterView(coordinator: self)
        router.rootView(view: view)
    }
    
    public func openListCurrency(parentView: ConverterViewProtocol, transition: UIViewControllerTransitioningDelegate, saveLocalData: SaveLocalDataProtocol, logicConverter: LogicConverterProtocol, sendGet: SendGetButton) {
        
        let childView = ListCurrencyBuilder.createConverterView(parentView: parentView, transition: transition, saveLocalData: saveLocalData, logicConverter: logicConverter, sendGet: sendGet)
        
        parentView.openListCurrency(child: childView, transition: transition)
    }
}
