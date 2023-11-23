//
//  MenuViewController.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 22/11/2023.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.estimatedRowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self

        // Enregistrement de la cellule personnalisée
        tableView.register(DishTableViewCell.self, forCellReuseIdentifier: "DishCell")
        view.addSubview(tableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.menus.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menus[section].dishs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Utilisation de DishTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "DishCell", for: indexPath) as! DishTableViewCell
        let dish = viewModel.menus[indexPath.section].dishs[indexPath.row]
        cell.configure(with: dish)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.menus[section].name
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
