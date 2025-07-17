//
//  model.swift
//  LuxuryTest
//
//  Created by dany on 17.07.2025.
//

import Foundation
class Model {

    let apiWork = APIWork()
    var array = [String]()
    

    func getName()  {
        apiWork.getData("TSLA") { companyData in
            if let data = companyData {
               print(data.name)
            } else {
                print("error")
            }
        }
    }
}
