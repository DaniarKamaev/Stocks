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
        if ((indexPath.row % 2) != 0) {
            cell.backgroundColor = .systemGray6
        }
        return cell
    }
    // переписать как у скутаренко при определеном значении прокрута таблици скрывать и показывать эллементы
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrolTimer?.invalidate()
        myTable.center.y = view.center.y + 100
        myTable.contentSize.height = view.frame.height + 100
        myFavorie.center.y = view.center.y - 380
        myStandart.center.y = view.center.y - 380
        myScrech.isHidden = true
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            scheduleScrollEndAction()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scheduleScrollEndAction()
    }
    
    private func scheduleScrollEndAction() {
        scrolTimer?.invalidate()
        scrolTimer = Timer.scheduledTimer(
            withTimeInterval: TimeInterval(1.5),
            repeats: false
            ) { [weak self] _ in
            self?.handleScrollEndrd()
        }
    }
    
    
    private func handleScrollEndrd() {
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
