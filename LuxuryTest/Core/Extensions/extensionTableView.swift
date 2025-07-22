//
//  extanshens.swift
//  LuxuryTest
//
//  Created by dany on 18.07.2025.
//
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.arrayCompany.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as? CastomCell else {
            return UITableViewCell()
        }
        cell.configurate(indexPath, tableView)
        if ((indexPath.row % 2) != 0) {
            cell.backgroundColor = .systemGray6
        }
        return cell
    }
    
    //MARK: - Top block
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        if y <= 1.0 {
            hide()
        } else {
            show()
        }
    }
    private func show() {
        myTable.center.y = view.center.y + 100
        myTable.contentSize.height = view.frame.height + 100
        myFavorie.center.y = view.center.y - 380
        myStandart.center.y = view.center.y - 380
        myScrech.isHidden = true
    }
    
    private func hide() {
        myTable.center.y = view.center.y + 200
        myTable.contentSize.height = view.frame.height - 100
        myFavorie.center.y = view.center.y - 305
        myStandart.center.y = view.center.y - 305
        myScrech.isHidden = false
    }
    
    //MARK: - Selectors
    @objc func refrashData() {
        myTable.reloadData()
        refresh.endRefreshing()
    }
    
}
