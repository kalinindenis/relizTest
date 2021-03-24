//
//  CurrencyRated.swift
//  RelizTestKalininD
//
//  Created by Денис on 18/03/2021.
//  Copyright © 2021 Денис. All rights reserved.
//

import Foundation

struct CurrencyRated: Codable {
    let result: String
    let provider: String
    let documentation: String
    let termsOfUse: String
    let timeLastUpdateUnix: Int
    let timeLastUpdateUtc: String
    let timeNextUpdateUnix: Int
    let timeNextUpdateUtc: String
    let timeEolUnix: Int
    let baseCode: String
    let rates: [String: Float]
    
    enum CodingKeys: String, CodingKey {
        case result
        case provider
        case documentation
        case termsOfUse =         "terms_of_use"
        case timeLastUpdateUnix = "time_last_update_unix"
        case timeLastUpdateUtc =  "time_last_update_utc"
        case timeNextUpdateUnix = "time_next_update_unix"
        case timeNextUpdateUtc =  "time_next_update_utc"
        case timeEolUnix =        "time_eol_unix"
        case baseCode =           "base_code"
        case rates
    }
}

