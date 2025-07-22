//
//  model.swift
//  LuxuryTest
//
//  Created by dany on 17.07.2025.
//
import UIKit
import Foundation
class ViewModel {
    
    let api = APIWork()
    let model = Model()
  
    
  
    
    
    
    //MARK: - Network
    public func getName(_ index: Int, complition: @escaping (String?) -> Void) {
        let element = model.arrayCompany[index]
        api.getData(element) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                if let res = try? JSONDecoder().decode(APIData.self, from: data) {
                    DispatchQueue.main.async {
                        complition(res.name)
                        print(res.name)
                    }
                } else {
                    complition(nil)
                    print("error in model 25")
                }
            }
        }
    }
    
    public func getPrice(_ index: Int, complition: @escaping (String?) -> Void) {
        let element = model.arrayCompany[index]
        api.getData(element) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                if let res = try? JSONDecoder().decode(APIData.self, from: data) {
                    DispatchQueue.main.async {
                        complition("\(res.shareOutstanding)")
                        print(res.shareOutstanding)
                    }
                } else {
                    complition(nil)
                    print("error in model 25")
                }
            }
        }
    }
    
    
    
    
    //MARK: - Don't touch plz, image work
    private func getLogo(_ index: Int, complition: @escaping (String?) -> Void) {
        let element = model.arrayCompany[index]
        api.getData(element) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                if let json = try? JSONDecoder().decode(APIData.self, from: data) {
                    complition(json.logo)
                    let aaa = json.logo
                    print(aaa)
                }
            }
        }
    }
    lazy var requestImage: (String, @escaping (UIImage?) -> Void) -> Void = { url, completion in
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: url),
                  let imageData = try? Data(contentsOf: imageUrl) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    
    public func getImage(_ index: Int, completion: @escaping (UIImage?) -> Void) {
        getLogo(index) { [weak self] imageUrl in
            guard let self = self, !imageUrl!.isEmpty else {
                completion(nil)
                return
            }
            
            self.requestImage(imageUrl!, completion)
        }
    }
}
