//
//  ViewController.swift
//  KeepNoteUI
//
//  Created by mac on 13/09/22.
//

import UIKit
import SideMenu

class ResultsVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}

class ViewController: UIViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController()
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        //for sidebarmenu
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
       print(" working")
    }
    @IBAction func didTap() {
        present(menu!, animated: true)
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let text  = searchController.searchBar.text else {
            return
        }
        let vc = searchController.searchResultsController as? ResultsVC
        vc?.view.backgroundColor = .yellow
        print(text)
    }
}


class MenuListController: UITableViewController {
    var items = ["First", "Second", "third"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
