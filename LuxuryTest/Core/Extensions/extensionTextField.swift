//
//  extensionTextField.swift
//  LuxuryTest
//
//  Created by dany on 21.07.2025.
//

import UIKit

extension ScrechViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
