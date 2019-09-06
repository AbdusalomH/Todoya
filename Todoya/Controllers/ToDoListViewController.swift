//
//  ViewController.swift
//  Todoya
//
//  Created by Mac on 8/23/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var listArray = [Item]()
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addbutton))
        
        
        let newItem = Item()
        newItem.title = "Go go go"
        listArray.append(newItem)
        let newitem2 = Item()
        newitem2.title = "Go home"
        listArray.append(newitem2)
        
        if listArray = defaults.array(forKey: "ToDoListArray") as! [String] {
            
            
            listArray = Item
        }
        
//        if let itemArray = defaults.array(forKey: "ToDoListArray") as? [String] {
//            listArray = itemArray
//
//
//        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = listArray[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    
    @objc  func addbutton(){
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new Todaya Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("success")
            
            let newItem = Item()
            newItem.title = textField.text!
            self.listArray.append(newItem)
            
            self.defaults.set(self.listArray, forKey: "ToDoListArray")
            
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertText) in
            alertText.placeholder = "Input new item"
            textField = alertText
            
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}

