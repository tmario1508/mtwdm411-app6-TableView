//
//  HeaderTableTableViewController.swift
//  app6-TableView
//
//  Created by MTWDM301-2021 on 15/10/21.
//

import UIKit

class HeaderTableTableViewController: UITableViewController {
    
    let pullrefreshcontrol = UIRefreshControl()
    
    var alfabetoArreglo = Array(modelo.lugares.keys).sorted
    {
        $0.description < $1.description
    }
    
    var siguienteAlfabeto = Array(siguiente.sig.keys).sorted {
        $0.description < $1.description
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.refreshControl = pullrefreshcontrol
        pullrefreshcontrol.addTarget(self, action: #selector(setearDatos), for: .valueChanged)
        
    }

    @objc func refreshTable(){
        alfabetoArreglo = alfabetoArreglo + siguienteAlfabeto
        self.tableView.reloadData()
        pullrefreshcontrol.endRefreshing()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return alfabetoArreglo.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letra = alfabetoArreglo[section]
        switch section {
        case 0...alfabetoArreglo.count:
            return modelo.lugares[letra]!.count
        default:
            return 1
        }
    }

    
    @objc func setearDatos() {
        modelo.lugares["G"] = ["Guanajuato","Guadalajara","Gandhi"]
        modelo.lugares["H"] = ["Honduras","Haiti","Huanimaro"]
        modelo.lugares["I"] = ["Irapuato","Ignacio","Indu"]
        alfabetoArreglo = Array(modelo.lugares.keys).sorted
        {
            $0.description < $1.description
        }
        print(modelo.lugares)
        print(alfabetoArreglo)
        self.tableView.reloadData()
        pullrefreshcontrol.endRefreshing()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)

        
        let letra = alfabetoArreglo[indexPath.section]
        
        switch indexPath.section {
        case 0...alfabetoArreglo.count:
            cell.textLabel?.text = modelo.lugares[letra]?[indexPath.row]
            
        default: break
            
        }
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let letra = alfabetoArreglo[section]
        switch section {
        case 0...alfabetoArreglo.count:
            return letra
        default:
            return letra
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
