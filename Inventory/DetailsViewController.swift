//
//  DetailsViewController.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var SKUField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    var itemList: ItemList!
    var items: Item!
    var index: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if index != nil {
            nameField.text = itemList.items[index].name
            SKUField.text = itemList.items[index].SKU
            descField.text = itemList.items[index].description
            dateField.date = itemList.items[index].dateAdded
            }
        
        
    }
    
    @IBAction func save(_ sender: Any) {
        if !nameField.text!.isEmpty{
            let name = nameField.text!
            let sku = SKUField.text!
            let descriptions = descField.text!
            let dateAdded = dateField.date
            let item = Item(name: name, SKU: sku, description: descriptions, dateAdded: dateAdded)
            if index == nil{
                itemList.addItem(item: item)
            } else {
                itemList.editItem(row: index , item: item)
                print("err")
                    
            }
            navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

