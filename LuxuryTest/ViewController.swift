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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdTable(myTable)
    }
    func createdTable(_ table: UITableView) {
        table.frame = view.frame
        table.register(UITableViewCell.self, forCellReuseIdentifier: "identifier")
        table.dataSource = self
        table.delegate = self
        view.addSubview(table)
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "identifier")
        model.getName { res in
            if let text = res {
                cell.textLabel?.text = text
            }
        }
        return cell
    }
}
