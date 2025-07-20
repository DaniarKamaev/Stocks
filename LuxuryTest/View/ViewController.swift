//
//  ViewController.swift
//  LuxuryTest
//
//  Created by dany on 16.07.2025.
//

import UIKit

class ViewController: UIViewController {
    let model = Model()
    let myTable = UITableView()
    let myImageView = UIImageView()
    let myFavorie = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdTable(myTable)
    }
    
    private func createdFavoriteButton(_ button: UIButton) {
      //  button.frame = CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
        view.addSubview(button)
    }
    
    private func createdTable(_ table: UITableView) {
        table.frame = view.frame
        table.center.y = view.center.y + 200
        table.register(CastomCell.self, forCellReuseIdentifier: "identifier")
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 80
        view.addSubview(table)
    }
}
