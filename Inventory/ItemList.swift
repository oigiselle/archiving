//
//  ItemList.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import Foundation

class ItemList{

    var items = [Item]()
    var key = "key"
   
    
    let itemURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("item.archive")
    }()
    
    init(){
        do{
            
            let data = try Data(contentsOf: itemURL)
            items = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Item]
        } catch let err{
            print(err)
        }
    }
    
    
    func addItem(item: Item){
        items.append(item)
        
    }
    
    func deleteItem(indexPath: IndexPath){
        items.remove(at: indexPath.row)
    }
    
    func moveItem(from: Int, to: Int){
        // complete code
    }
    
    func save(){
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            try data.write(to: itemURL)
        } catch let err{
            print(err)
        }
    }
    
    func editItem(row: Int, item: Item) {
            items.remove(at: row)
            items.insert(item, at: row)
        }
    

}
