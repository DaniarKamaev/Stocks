//
//  ViewController.swift
//  LuxuryTest
//
//  Created by dany on 16.07.2025.
//

import UIKit

class ViewController: UIViewController {
    let viewModel = ViewModel()
    let model = Model()
    let myTable = UITableView()
    let myImageView = UIImageView()
    let myFavorie = UIButton()
    let myScrech = UIButton()
    let myStandart = UIButton()
    let refresh = UIRefreshControl()
    var scrolTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdTable(myTable)
        createdFavoriteButton(myFavorie)
        createdScreachButton(myScrech)
        createdStandertButton(myStandart)
        creatadRefrash(refresh)
    }
    
    private func createdScreachButton(_ button: UIButton) {
        let image = UIImage(named: "screch")
        button.frame = CGRect(x: 0, y: 60, width: 400, height: 60)
        button.center.x = view.center.x
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        view.addSubview(button)
    }
    
    private func createdStandertButton(_ button: UIButton) {
        let image = UIImage(named: "stocs")
        button.frame = CGRect(x: 0, y: 0, width: 65, height: 18)
        button.center.y = myFavorie.center.y
        button.center.x = view.center.x - 130
        button.setImage(image, for: .normal)
        
        view.addSubview(button)
    }
    private func creatadRefrash(_ refrash: UIRefreshControl) {
        refrash.tintColor = .gray
        refrash.attributedTitle = NSAttributedString(string: "")
        refrash.addTarget(self, action: #selector(refrashData), for: .valueChanged)
    }
    
    private func createdFavoriteButton(_ button: UIButton) {
        let image = UIImage(named: "favorite")
        button.frame = CGRect(x: 0, y: 130, width: 100, height: 30)
        button.center.x = view.center.x - 30        
        button.setImage(image, for: .normal)
        view.addSubview(button)
    }
    
    private func createdTable(_ table: UITableView) {
        table.frame = view.frame
        table.center.y = view.center.y + 200
        table.register(CastomCell.self, forCellReuseIdentifier: "identifier")
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 80
        table.refreshControl = refresh
        view.addSubview(table)
    }
   

}
