//
//  CreateUrlService.swift
//  RelizTestKalininD
//
//  Created by Денис on 18/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import Foundation

class CreateUrlService {
    
    public func urlCurrencyRated() -> URL {
        
        var urlComponent = URLComponents()
        
        urlComponent.scheme = "https"
        urlComponent.host = "open.exchangerate-api.com"
        urlComponent.path = "/v6/latest"
        
        guard let url = urlComponent.url else {
            preconditionFailure("URL не валидный")
        }
        return url
    }
}
