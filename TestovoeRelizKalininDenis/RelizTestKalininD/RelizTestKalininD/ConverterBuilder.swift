//
//  ViewController.swift
//  RelizTestKalininD
//
//  Created by Денис on 18/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import UIKit

protocol ConverterBuilderProtocol {
    static func createConverterView(coordinator: CoordinatorProtocol) -> UIViewController
}

final class ConverterBuilder: ConverterBuilderProtocol {
    
    static func createConverterView(coordinator: CoordinatorProtocol) -> UIViewController {
        let view = ConverterViewController()
        let network = NetworkService()
        let saveLocalData = SaveLocalData()
        let logicConverter = LogicConverter(localData: saveLocalData)
        let transition = PanelTransition()
        let presenter = ConverterPresenter(network: network, view: view, saveLocalData: saveLocalData, logicConverter: logicConverter, transition: transition)
        
        presenter.coordinator = coordinator
        view.presenter = presenter
        return view
    }
}

