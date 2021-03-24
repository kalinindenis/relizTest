//
//  ListCurrencyBuilder.swift
//  RelizTestKalininD
//
//  Created by Денис on 21/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import UIKit

protocol ListCurrencyBuilderProtocol {
    static func createConverterView(parentView: ConverterViewProtocol, transition: UIViewControllerTransitioningDelegate, saveLocalData: SaveLocalDataProtocol, logicConverter: LogicConverterProtocol, sendGet: SendGetButton) -> UIViewController
}

final class ListCurrencyBuilder: ListCurrencyBuilderProtocol {
    
    static func createConverterView(parentView: ConverterViewProtocol, transition: UIViewControllerTransitioningDelegate, saveLocalData: SaveLocalDataProtocol, logicConverter: LogicConverterProtocol, sendGet: SendGetButton) -> UIViewController {
        
        let childView = SelectionCurrencyView()
        let parentView = parentView
        
        let presenter = SelectionCurrencyPresenter(transition: transition, saveLocalData: saveLocalData, logicConverter: logicConverter, sendGet: sendGet)
        presenter.childView = childView
        presenter.parentView = parentView
        childView.presenter = presenter
        
        return childView
    }
    
    
}

