//
//  ViewController.swift
//  LuxuryTest
//
//  Created by dany on 16.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var showFavorite = false
    
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
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(button)
    }
    
    
    private func createdStandertButton(_ button: UIButton) {
        let image = UIImage(named: "stocs")
        button.frame = CGRect(x: 0, y: 0, width: 65, height: 18)
        button.center.y = myFavorie.center.y
        button.center.x = view.center.x - 130
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(stocsActions), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(likeActions), for: .touchUpInside)
        view.addSubview(button)
    }
    
    private func createdTable(_ table: UITableView) {
        navigationController?.navigationBar.isHidden = true
        table.frame = view.frame
        table.center.y = view.center.y + 200
        table.register(CastomCell.self, forCellReuseIdentifier: "identifier")
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 80
        table.refreshControl = refresh
        view.addSubview(table)
    }
   
    @objc func tap() {
        let vc = ScrechViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    @objc func stocsActions() {
        showFavorite = false
        let image = UIImage(named: "favorite")
        
        let imageStoc = UIImage(named: "stocs")
        myFavorie.setImage(image, for: .normal)
        myStandart.setImage(imageStoc, for: .normal)
        myTable.reloadData()
    }
    
    @objc func likeActions() {
        showFavorite = true
        let image = UIImage(named: "Favorite-1")
        let imageStoc = UIImage(named: "stocsLow")
        myFavorie.setImage(image, for: .normal)
        myStandart.setImage(imageStoc, for: .normal)
        myTable.reloadData()
    }
}
