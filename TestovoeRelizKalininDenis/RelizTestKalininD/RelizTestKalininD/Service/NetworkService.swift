//
//  NetworkService.swift
//  RelizTestKalininD
//
//  Created by Денис on 18/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func getRequestCurrencyRated(completionHandler: @escaping (CurrencyRated) -> ())
}

class NetworkService: NetworkServiceProtocol {
    
    private let createUrl = CreateUrlService()
    
    public func getRequestCurrencyRated(completionHandler: @escaping (CurrencyRated) -> ()) {
        
        let url = self.createUrl.urlCurrencyRated()
        
        let decoder = JSONDecoder()
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) -> Void in
            
            let httpResponse = response as? HTTPURLResponse
            
            switch httpResponse?.statusCode {
                
            case 200:
                let currencyRated = try! decoder.decode(CurrencyRated.self, from: data!)
                DispatchQueue.main.async {
                    completionHandler(currencyRated)
                }
            default:
                print ("error" , httpResponse?.statusCode)
                break
            }
            
        }.resume()
    }
    
}
