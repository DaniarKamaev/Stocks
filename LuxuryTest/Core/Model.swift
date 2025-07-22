//
//  Model.swift
//  LuxuryTest
//
//  Created by dany on 20.07.2025.
//

import Foundation

class Model {
    let arrayCompany = ["AAPL", "TSLA", "ROSN", "MSFT", "AMZN", "GOOGL", "MA", "BAC", "ZM", "APPN", "APPF"]
    
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
