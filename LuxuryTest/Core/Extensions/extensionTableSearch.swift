//
//  extensionTextField.swift
//  LuxuryTest
//
//  Created by dany on 21.07.2025.
//

import UIKit

extension ScrechViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? CastomCell else {
            return UITableViewCell()
        }
        let company = searchResults[indexPath.row]
        
        cell.configurate(with: company, tableView)
        if ((indexPath.row % 2) != 0) {
            cell.backgroundColor = .systemGray6
        }

        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCompany = searchResults[indexPath.row]
        print("Selected company: \(selectedCompany)")
        
    }
}
