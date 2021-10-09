//
//  ViewController.swift
//  app6-TableView
//
//  Created by mario on 10/8/21.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var nombres = ["Mario", "Juan", "Pedro", "Miguel"]
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nombres.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cellNombre", for: indexPath)
        cell.textLabel?.text = nombres[indexPath.row]
        return cell
    }

}

