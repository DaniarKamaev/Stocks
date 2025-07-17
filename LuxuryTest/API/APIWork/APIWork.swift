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
        
        
        let url = URL(string: "https://finnhub.io/api/v1/stock/profile2?symbol=" + companyName + "&token=d1sfvbpr01qkbods3gq0d1sfvbpr01qkbods3gqg")

        let request = URLRequest(url: url!)
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
            print(data)
            if let apiData = self.jsonDecode(from: data) {
                DispatchQueue.main.async {
                    complition(.success(data))
                }
            } else {
                print("error parse data")
            }
        }

        task.resume()
    }
    func jsonDecode(from data: Data) -> APIData? {
        do {
            let decoder = JSONDecoder()
            let apiData = try decoder.decode(APIData.self, from: data)
            return apiData
        } catch {
            print("lol error in 50 line")
            return nil
        }
    }
}
