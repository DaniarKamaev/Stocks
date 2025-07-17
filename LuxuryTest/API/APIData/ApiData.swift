//
//  ApiData.swift
//  LuxuryTest
//
//  Created by dany on 16.07.2025.
//

import Foundation

struct APIData: Codable {
    let country: String
    let currency: String
    let exchange: String
    let finnhubIndustry: String
    let ipo: String
    let logo: String
    let marketCapitalization: Double
    let name: String
    let phone: String
    let shareOutstanding: Double
    let ticker: String
    let weburl: String
    
    enum CodingKeys: String, CodingKey {
        case country
        case currency
        case exchange
        case finnhubIndustry = "finnhubIndustry"
        case ipo
        case logo
        case marketCapitalization = "marketCapitalization"
        case name
        case phone
        case shareOutstanding = "shareOutstanding"
        case ticker
        case weburl
    }
}
