//
//  ItemTableViewController.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//
//  Giselle Salvador A00244514

import UIKit

class ItemTableViewController: UITableViewController {
    
    var itemList = ItemList()
    
//    @IBAction func toggleEditMode(_ sender: UIBarButtonItem){
//        if isEditing{
//            sender.title = "Edit"
//            setEditing(false, animated: true)
//        }else{
//            sender.title = "Done"
//            setEditing(true, animated: true)
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
            tableView.reloadData()
        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemList.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)

        let item = itemList.items[indexPath.row].name
                cell.textLabel?.text = "\(item)"

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            // Return false if you do not want the specified item to be editable.
            return true
        }
        
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailsViewController
        destination.itemList = itemList
        destination.index = tableView.indexPathForSelectedRow?.row
    }
        
}


