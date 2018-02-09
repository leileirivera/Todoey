//
//  ViewController.swift
//  Todoey
//
//  Created by Leah Rivera on 2/8/18.
//  Copyright © 2018 Lei Rivera. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()

    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newItem = Item()
        newItem.title = "Find Mike"
        newItem.done = false
        
        itemArray.append(newItem)
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            itemArray = items
        }
        
        
    }

    
    //Mark - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        //Ternary operator ==>
        // value = condition ? valueIftrue : valueIfFalse
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        //if item.done == true {
        //    cell.accessoryType = .checkmark
        //}
        //else {
        //    cell.accessoryType = .none
        //}
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
        
    }
    
    //Mark - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.tableView.reloadData()
        
    }
    
    //Mark - Add New Itesm
    @IBAction func addButtonPressed(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once user clicks Add item in our uiAlter
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
}

