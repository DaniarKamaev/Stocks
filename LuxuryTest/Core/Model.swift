//
//  Model.swift
//  LuxuryTest
//
//  Created by dany on 20.07.2025.
//

import Foundation

class Model {
    let arrayCompany = ["AAPL", "TSLA", "ROSN", "MSFT", "AMZN", "GOOGL", "MA", "BAC", "ZM", "APPN", "APPF"]
    
    let companyNames: [String: String] = [
        "AAPL": "Apple Inc.",
        "TSLA": "Tesla Inc.",
        "ROSN": "Rosneft",
        "MSFT": "Microsoft Corporation",
        "AMZN": "Amazon.com Inc.",
        "GOOGL": "Alphabet Inc.",
        "MA": "Mastercard Incorporated",
        "BAC": "Bank of America Corporation",
        "ZM": "Zoom Video Communications",
        "APPN": "Appian Corporation",
        "APPF": "AppFolio Inc."
    ]
        
    func searchCompanies(with query: String) -> [String] {
        let lowercasedQuery = query.lowercased()
        return arrayCompany.filter { ticker in
            ticker.lowercased().contains(lowercasedQuery) ||
            (companyNames[ticker]?.lowercased().contains(lowercasedQuery) ?? false)
        }
    }
    
    
    private let favoritesKeys = "favoriteCompanies"
    
    public func getFavoriteCompanies() -> [String] {
        UserDefaults.standard.stringArray(forKey: favoritesKeys) ?? []
    }
    
    public func addFavorite(company: String) {
        var favorites = getFavoriteCompanies()
        if !favorites.contains(company) {
            favorites.append(company)
            UserDefaults.standard.set(favorites, forKey: favoritesKeys)
            UserDefaults.standard.synchronize()
        }
    }
    
    public func removeFavorite(company: String) {
        var favorites = getFavoriteCompanies()
        if let index = favorites.firstIndex(of: company) {
            favorites.remove(at: index)
            UserDefaults.standard.set(favorites, forKey: favoritesKeys)
        }
    }
    
    public func isFavorite(company: String) -> Bool {
        return getFavoriteCompanies().contains(company)
    }
    
}
