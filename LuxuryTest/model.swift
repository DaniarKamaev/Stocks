//
//  model.swift
//  LuxuryTest
//
//  Created by dany on 17.07.2025.
//

import Foundation
class Model {

    let api = APIWork()
    
    func getName(complition: @escaping (String?) -> Void) {
        api.getData("TSLA") { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                if let res = try? JSONDecoder().decode(APIData.self, from: data) {
                    DispatchQueue.main.async {
                        complition(res.name)
                    }
                } else {
                    complition(nil)
                }
            }
        }
    }
}

    
  /*  func getName(name: inout APIData) -> APIData {
        let queue = DispatchQueue.global(qos: .userInteractive)
        queue.async {
            self.apiWork.getData("TSLA") { [weak self] result in
                switch result {
                case .failure(let error):
                    print("idi nah")
                case .success(let data):
                    let json = try? JSONDecoder().decode(APIData.self, from: data)
                    name = json!
                }
            }
        }
        return name
    }
 */
