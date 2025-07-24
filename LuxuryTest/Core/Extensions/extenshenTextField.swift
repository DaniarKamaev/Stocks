//
//  extenshen.swift
//  LuxuryTest
//
//  Created by dany on 24.07.2025.
//
import UIKit

extension ScrechViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            isSearching = false
            resultsTableView.isHidden = true
            popularLabel.isHidden = false
            [ddd, sss, vvv, ccc, bbb, ppp].forEach { $0.isHidden = false }
        }
    }
}
