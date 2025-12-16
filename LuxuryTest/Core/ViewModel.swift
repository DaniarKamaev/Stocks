//
//  model.swift
//  LuxuryTest
//
//  Created by dany on 17.07.2025.
//
import UIKit

class ViewModel {
    
    let api = APIWork()
    let model = Model()
    
    private let operationQueue = OperationQueue()
    private var operations: [Int: Operation] = [:]
    
    init() {
        operationQueue.maxConcurrentOperationCount = 3
        operationQueue.qualityOfService = .userInitiated
    }
    
    //MARK: - Network Text
    public func get(_ index: Int, completion: @escaping (String?, String?, String?) -> Void) {
        guard index < model.arrayCompany.count else {
            completion(nil, nil, nil)
            return
        }
        
        let element = model.arrayCompany[index]
                cancelRequest(for: index)
        
        let operation = BlockOperation { [weak self] in
            guard let self = self else { return }
            
            self.api.getData(element) { result in
                switch result {
                case .failure(let error):
                    print("Error fetching data for \(element): \(error)")
                    DispatchQueue.main.async {
                        completion(nil, nil, nil)
                    }
                    
                case .success(let data):
                    if let res = try? JSONDecoder().decode(APIData.self, from: data) {
                        DispatchQueue.main.async {
                            completion("\(res.shareOutstanding)", "\(res.name)", "\(res.logo)")
                        }
                    } else {
                        print("Failed to decode API response for \(element)")
                        DispatchQueue.main.async {
                            completion(nil, nil, nil)
                        }
                    }
                }
                
                DispatchQueue.main.async { [weak self] in
                    self?.operations.removeValue(forKey: index)
                }
            }
        }
        
        operations[index] = operation
        operationQueue.addOperation(operation)
    }
    
    public func cancelRequest(for index: Int) {
        operations[index]?.cancel()
        operations.removeValue(forKey: index)
    }
    
    public func cancelAllRequests() {
        operationQueue.cancelAllOperations()
        operations.removeAll()
    }
    
    //MARK: - Image Loading
    private func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil,
                  let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
    
    //MARK: - Получение информации о компании и изображения
    public func getCompanyInfoAndImage(_ index: Int, completion: @escaping (String?, String?, UIImage?) -> Void) {
        get(index) { [weak self] shareOutstanding, name, logoUrl in
            guard let self = self else { return }
            
            guard let logoUrl = logoUrl, !logoUrl.isEmpty else {
                completion(shareOutstanding, name, nil)
                return
            }
            
            self.loadImage(from: logoUrl) { image in
                completion(shareOutstanding, name, image)
            }
        }
    }
    
    //MARK: - Получение данных для конкретного символа
    public func getDataForSymbol(_ symbol: String, completion: @escaping (String?, String?, UIImage?) -> Void) {
        guard let index = model.arrayCompany.firstIndex(of: symbol) else {
            completion(nil, nil, nil)
            return
        }
        
        getCompanyInfoAndImage(index, completion: completion)
    }
}
