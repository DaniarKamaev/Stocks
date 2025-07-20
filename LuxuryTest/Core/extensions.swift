//
//  extanshens.swift
//  LuxuryTest
//
//  Created by dany on 18.07.2025.
//
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.arrayCompany.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as? CastomCell else {
            return UITableViewCell()
        }
        cell.configurate(indexPath, tableView)
        return cell
    }
}
