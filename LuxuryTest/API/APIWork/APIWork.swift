//
//  APIWork.swift
//  LuxuryTest
//
//  Created by dany on 16.07.2025.
//

// API Key d1sfvbpr01qkbods3gq0d1sfvbpr01qkbods3gqg
import UIKit

class APIWork {
    
    func getData(_ companyName: String, complition: @escaping (Result<Data, Error>) -> Void ) {
        
        
        guard let url = URL(string: "https://finnhub.io/api/v1/stock/profile2?symbol=" + companyName + "&token=d1sfvbpr01qkbods3gq0d1sfvbpr01qkbods3gqg") else {
            print("not url")
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!)
                complition(.failure(error!))
                return
            }
            guard let data = data else {
                print("Data is empty")
                complition(.failure(error!))
                return
            }
            DispatchQueue.main.async {
                print(data)
                complition(.success(data))
            }
        }
        task.resume()
    }
}
