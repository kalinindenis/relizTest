//
//  ConverterPresenter.swift
//  RelizTestKalininD
//
//  Created by Денис on 18/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import UIKit

protocol ConverterViewProtocol: class {
    func setTitleButton(title: String, sendGet: SendGetButton)
    func setResultConvert(result: Float)
    func openListCurrency(child: UIViewController,transition: UIViewControllerTransitioningDelegate)
    func dismisListCurrency()
}

protocol ConverterPresenterProtocol  {
    
    func getRequestCurrencyRated()
    func tapConvertButton(send: Float)
    func tapSendListCurrency()
    func tapGetListCurrency()
}

class ConverterPresenter : ConverterPresenterProtocol {
    
    let transition: UIViewControllerTransitioningDelegate!
    let logicConverter: LogicConverterProtocol!
    let saveLocalData: SaveLocalDataProtocol!
    let network: NetworkServiceProtocol!
    weak var view: ConverterViewProtocol?
    weak var coordinator: CoordinatorProtocol?
    
    required init(network: NetworkServiceProtocol,view: ConverterViewProtocol, saveLocalData: SaveLocalDataProtocol, logicConverter: LogicConverterProtocol, transition: UIViewControllerTransitioningDelegate) {
        self.network = network
        self.view = view
        self.saveLocalData = saveLocalData
        self.logicConverter = logicConverter
        self.transition = transition
    }
    
    func getRequestCurrencyRated() {
        
        network.getRequestCurrencyRated(completionHandler: { (success) in
            let data = success
            self.saveLocalData.setCurrencyData(data: data)
        })
    }
    
    func tapConvertButton(send: Float) {
        
        if send != 0 {
            guard let result = logicConverter.calculationCurrency(amountCurrency: send) else {
                return
            }
            
            view?.setResultConvert(result: result)
        }
    }
    
    func tapSendListCurrency() {
        
        guard let view = view else {
            return
        }
        coordinator?.openListCurrency(parentView: view, transition: transition, saveLocalData: saveLocalData, logicConverter: logicConverter, sendGet: .send)
    }
    
    func tapGetListCurrency() {
        
        guard let view = view else {
            return
        }
        coordinator?.openListCurrency(parentView: view, transition: transition, saveLocalData: saveLocalData, logicConverter: logicConverter, sendGet: .get)
    }
    
}


