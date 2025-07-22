//
//  ScrechViewController.swift
//  LuxuryTest
//
//  Created by dany on 21.07.2025.
//

import UIKit

class ScrechViewController: UIViewController {
    
    let model = Model()
    let popularLabel = UILabel()
    let myTextField = UITextField()
    let textField = UIView()
    var ddd = UIButton()
    var sss = UIButton()
    let vvv = UIButton()
    let ccc = UIButton()
    let bbb = UIButton()
    let ppp = UIButton()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdPopularLabel(popularLabel)
        createdHelp()
        createdTextField(textField,myTextField)
        stopEdit()
    }
    
    public func createdTextField(_ View: UIView, _ textField: UITextField) {
        let myImage = UIImage(named: "back")
        
        let buttonBack = UIButton()
        buttonBack.frame = CGRect(x: 12, y: 10, width: 24, height: 24)
        buttonBack.setImage(myImage, for: .normal)
        buttonBack.addTarget(self, action: #selector(tapBack), for: .touchUpInside)
        
        let image = UIImageView()
        image.frame = CGRect(x: 12, y: 10, width: 24, height: 24)
        image.image = myImage
        
        View.frame = CGRect(x: 20, y: 100, width: 370, height: 45)
        View.layer.borderWidth = 1.0
        View.layer.cornerRadius = 20
        
        textField.becomeFirstResponder()
        textField.delegate = self
        textField.frame = CGRect(x: 43, y: 2, width: 400, height: 40)
        textField.attributedPlaceholder = NSAttributedString(string: "Find company or ticker",
                                                             attributes: [
                                                                .foregroundColor: UIColor.black,
                                                                .font: UIFont.boldSystemFont(ofSize: 18)
                                                             ])
        View.addSubview(buttonBack)
        View.addSubview(textField)
        view.addSubview(View)
    }
    
    
    private func createdHelp() {
        let array = [ddd, sss, vvv, ccc, bbb, ppp]
        let viewCount = model.arrayCompany.count
        var x = 20
        for i in 0..<viewCount - 6 {
            array[i].frame = CGRect(x: x, y: 200, width: 70, height: 30)
            createView(array[i], index: i)
            x += 80
        }
    }
    
    private func createdPopularLabel(_ label: UILabel) {
        label.frame = CGRect(x: 20, y: 160, width: 400, height: 24)
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "Popular requests"
        view.addSubview(label)
    }
    
    private func createView(_ button: UIButton, index: Int) {
        button.backgroundColor = .systemGray6
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.setTitleColor(.black, for: .normal)
        button.setTitle(model.arrayCompany[index], for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(tap(button:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    private func stopEdit() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEdit))
        view.addGestureRecognizer(tap)
    }
     
    @objc func tap(button: UIButton) {
        myTextField.text = button.titleLabel?.text
    }
    @objc func tapBack() {
        navigationController?.popViewController(animated: false)
    }
    @objc func endEdit() {
        view.endEditing(true)
    }

}
