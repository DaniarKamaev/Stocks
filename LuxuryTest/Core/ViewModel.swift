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
  
    
  
    
    
    //MARK: - Network Text
      public func get(_ index: Int, complition: @escaping (String?, String?, String?) -> Void) {
          let element = model.arrayCompany[index]
          api.getData(element) { result in
              switch result {
              case .failure(let error):
                print(error)
                DispatchQueue.main.async { complition(nil,nil,nil) }
                
                complition(nil,nil,nil)
              case .success(let data):
                  if let res = try? JSONDecoder().decode(APIData.self, from: data) {
                      DispatchQueue.main.async {
                        complition("\(res.shareOutstanding)", "\(res.name)", "\(res.logo)")
                      }
                  } else {
                    print("error api reqest")
                    DispatchQueue.main.async { complition(nil,nil,nil) }
                  }
              }
          }
      }
    //MARK: - Don't touch plz, image work
    
    private func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
            DispatchQueue.global().async {
                guard let url = URL(string: urlString),
                      let data = try? Data(contentsOf: url) else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                    return
                }
                
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
        
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
}
