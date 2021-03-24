//
//  LogicConverter.swift
//  RelizTestKalininD
//
//  Created by Денис on 21/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import Foundation

protocol LogicConverterProtocol {
    func calculationCurrency(amountCurrency: Float) -> Float?
    func chosenСurrency(sendGet: SendGetButton, value: Float)
}

class LogicConverter: LogicConverterProtocol {
    
    private var send: Float?
    private var get: Float?
    
    let localData: SaveLocalDataProtocol!
    
    init(localData: SaveLocalDataProtocol) {
        self.localData = localData
        setDefaultValue()
    }
    
    private func setDefaultValue() {
        let rates = localData!.getCurrencyData()?.rates
        self.send = rates?["RUB"]
        self.get = rates?["EUR"]
    }
    
    public func chosenСurrency(sendGet: SendGetButton, value: Float) {
        
        switch sendGet {
        case .send:
            print ("send")
            send = value
        case .get:
            print ("get")
            get = value
        }
    }
    
    public func calculationCurrency(amountCurrency: Float) -> Float? {
        
        guard let send = send else {
            return nil
        }
        
        guard let get = get else {
            return nil
        }
        return (amountCurrency / send) * get
    }
    
}
