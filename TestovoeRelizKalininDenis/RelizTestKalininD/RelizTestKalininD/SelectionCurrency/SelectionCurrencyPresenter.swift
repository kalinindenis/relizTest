//
//  SelectionCurrencyPresenter.swift
//  RelizTestKalininD
//
//  Created by Денис on 21/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import UIKit

protocol SelectionCurrencyViewProtocol: class {
}

protocol SelectionCurrencyPresenterProtocol  {
    func dismissChildView()
    func chosenCurrency()
    func setCurrency(currency: String)
    func returnListCurrency() -> [String]?
}

class SelectionCurrencyPresenter : SelectionCurrencyPresenterProtocol {
    
    weak var parentView: ConverterViewProtocol?
    weak var childView: SelectionCurrencyViewProtocol?
    weak var coordinator: CoordinatorProtocol?
    private let saveLocalData: SaveLocalDataProtocol!
    private let logicConverter: LogicConverterProtocol!
    private let transition: UIViewControllerTransitioningDelegate
    private let sendGet: SendGetButton?
    private var currency = ""
    
    required init(transition: UIViewControllerTransitioningDelegate, saveLocalData: SaveLocalDataProtocol, logicConverter: LogicConverterProtocol!,sendGet: SendGetButton) {
        self.transition = transition
        self.saveLocalData = saveLocalData
        self.logicConverter = logicConverter
        self.sendGet = sendGet
    }
    
    public func returnListCurrency() -> [String]? {
        
        guard let data = saveLocalData.getCurrencyData() else {
            return nil
        }
        
        var listCurrency = [String]()
        
        for i in data.rates {
           listCurrency.append(i.key)
        }
        
        return listCurrency
        // будет меняться порядок валют в коллекции, в словаре значения не привязаны к порядковому номеру
        // если это критично, можно сделать так:
        /*
         let listCurrency = [
         "USD",
         "AED",
         "AFN",
         "ALL",
         "AMD",
         "ANG",
         "AOA",
         "ARS",
         "AUD",
         "AWG",
         "AZN",
         "BAM",
         "BBD",
         "BDT",
         "BGN",
         "BHD",
         "BIF",
         "BMD",
         "BND",
         "BOB",
         "BRL",
         "BSD",
         "BTN",
         "BWP",
         "BYN",
         "BZD",
         "CAD",
         "CDF",
         "CHF",
         "CLP",
         "CNY",
         "COP",
         "CRC",
         "CUC",
         "CUP",
         "CVE",
         "CZK",
         "DJF",
         "DKK",
         "DOP",
         "DZD",
         "EGP",
         "ERN",
         "ETB",
         "EUR",
         "FJD",
         "FKP",
         "FOK",
         "GBP",
         "GEL",
         "GGP",
         "GHS",
         "GIP",
         "GMD",
         "GNF",
         "GTQ",
         "GYD",
         "HKD",
         "HNL",
         "HRK",
         "HTG",
         "HUF",
         "IDR",
         "ILS",
         "IMP",
         "INR",
         "IQD",
         "IRR",
         "ISK",
         "JMD",
         "JOD",
         "JPY",
         "KES",
         "KGS",
         "KHR",
         "KID",
         "KMF",
         "KRW",
         "KWD",
         "KYD",
         "KZT",
         "LAK",
         "LBP",
         "LKR",
         "LRD",
         "LSL",
         "LYD",
         "MAD",
         "MDL",
         "MGA",
         "MKD",
         "MMK",
         "MNT",
         "MOP",
         "MRU",
         "MUR",
         "MVR",
         "MWK",
         "MXN",
         "MYR",
         "MZN",
         "NAD",
         "NGN",
         "NIO",
         "NOK",
         "NPR",
         "NZD",
         "OMR",
         "PAB",
         "PEN",
         "PGK",
         "PHP",
         "PKR",
         "PLN",
         "PYG",
         "QAR",
         "RON",
         "RSD",
         "RUB",
         "RWF",
         "SAR",
         "SBD",
         "SCR",
         "SDG",
         "SEK",
         "SGD",
         "SHP",
         "SLL",
         "SOS",
         "SRD",
         "SSP",
         "STN",
         "SYP",
         "SZL",
         "THB",
         "TJS",
         "TMT",
         "TND",
         "TOP",
         "TRY",
         "TTD",
         "TVD",
         "TWD",
         "TZS",
         "UAH",
         "UGX",
         "UYU",
         "UZS",
         "VES",
         "VND",
         "VUV",
         "WST",
         "XAF",
         "XCD",
         "XDR",
         "XOF",
         "XPF",
         "YER",
         "ZAR",
         "ZMW" ]
         */
    }
    
    public func setCurrency(currency: String) {
        self.currency = currency
    }
    
    public func dismissChildView() {
        
        parentView?.dismisListCurrency()
    }
    
    public func chosenCurrency() {
        
        guard let sendGet = sendGet else {
            print ("error sendget")
            return
        }
        
        guard let value = switchString(currency: currency) else {
            print ("нет такого")
            return
        }
        
        parentView?.setTitleButton(title: currency, sendGet: sendGet)
        logicConverter.chosenСurrency(sendGet: sendGet, value: value)
    }
    
    private func switchString(currency: String) -> Float? {
        
        guard let data = saveLocalData.getCurrencyData() else {
            print ("нет локал данных")
            return nil
        }
        return data.rates[currency]
    }
    
}
