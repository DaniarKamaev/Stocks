//
//  ScrechViewController.swift
//  LuxuryTest
//
//  Created by dany on 21.07.2025.
//

import UIKit

class ScrechViewController: UIViewController {
    
    let model = Model()
    let viewModel = ViewModel()
    let popularLabel = UILabel()
    let myTextField = UITextField()
    let textField = UIView()
    var ddd = UIButton()
    var sss = UIButton()
    let vvv = UIButton()
    let ccc = UIButton()
    let bbb = UIButton()
    let ppp = UIButton()
    let resultsTableView = UITableView()
    var searchResults: [String] = []
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        stopEdit()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        createdPopularLabel(popularLabel)
        createdHelp()
        createdTextField(textField, myTextField)
    }
    
    private func setupTableView() {
        resultsTableView.frame = CGRect(x: 0, y: 150, width: view.frame.width, height: view.frame.height - 150)
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.register(CastomCell.self, forCellReuseIdentifier: "searchCell")
        resultsTableView.isHidden = true
        resultsTableView.rowHeight = 80
        view.addSubview(resultsTableView)
    }
    
    public func createdTextField(_ View: UIView, _ textField: UITextField) {
        let myImage = UIImage(named: "back")
        
        let buttonBack = UIButton()
        buttonBack.frame = CGRect(x: 12, y: 10, width: 24, height: 24)
        buttonBack.setImage(myImage, for: .normal)
        buttonBack.addTarget(self, action: #selector(tapBack), for: .touchUpInside)
        
        View.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 45)
        View.layer.borderWidth = 1.0
        View.layer.cornerRadius = 20
        
        textField.becomeFirstResponder()
        textField.delegate = self
        textField.frame = CGRect(x: 43, y: 2, width: View.frame.width - 50, height: 40)
        textField.attributedPlaceholder = NSAttributedString(
            string: "Find company or ticker",
            attributes: [
                .foregroundColor: UIColor.black,
                .font: UIFont.boldSystemFont(ofSize: 18)
            ]
        )
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        View.addSubview(buttonBack)
        View.addSubview(textField)
        view.addSubview(View)
    }
    
    private func createdHelp() {
        let array = [ddd, sss, vvv, ccc, bbb, ppp]
        let viewCount = min(model.arrayCompany.count, 6)
        var x = 20
        for i in 0..<viewCount {
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
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let searchText = textField.text, !searchText.isEmpty else {
            isSearching = false
            resultsTableView.isHidden = true
            popularLabel.isHidden = false
            createdHelp()
            return
        }
        
        isSearching = true
        popularLabel.isHidden = true
        [ddd, sss, vvv, ccc, bbb, ppp].forEach { $0.isHidden = true }
            searchResults = model.arrayCompany.filter { $0.lowercased().contains(searchText.lowercased()) }
            resultsTableView.reloadData()
            resultsTableView.isHidden = false
        }
        
        @objc func tap(button: UIButton) {
                myTextField.text = button.titleLabel?.text
                textFieldDidChange(myTextField)
            }
            
            @objc func tapBack() {
                navigationController?.popViewController(animated: false)
            }
            
            @objc func endEdit() {
                view.endEditing(true)
            }
        }
