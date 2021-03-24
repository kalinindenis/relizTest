//
//  SaveLocalData.swift
//  RelizTestKalininD
//
//  Created by Денис on 18/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import Foundation

protocol SaveLocalDataProtocol: class {
    func setCurrencyData(data: CurrencyRated)
    func getCurrencyData() -> CurrencyRated?
}

class SaveLocalData: SaveLocalDataProtocol {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let defaults = UserDefaults.standard
    private let key = "CurrencyRated"
    
    public func setCurrencyData(data: CurrencyRated) {
        
        guard let encoded = try? encoder.encode(data) else {
            return
        }
        
        defaults.set(encoded, forKey: key)
    }
    
    public func getCurrencyData() -> CurrencyRated? {
        
        guard let savedCurrency = defaults.object(forKey: key) as? Data else {
            return nil
        }
        
        guard let loadedCurrency = try? decoder.decode(CurrencyRated.self, from: savedCurrency) else {
            return nil
        }
        
        return loadedCurrency
    }
    
}
