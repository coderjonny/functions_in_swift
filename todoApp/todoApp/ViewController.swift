//
//  ViewController.swift
//  todoApp
//
//  Created by jonny on 7/19/15.
//  Copyright © 2015 jonny kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var textInput: UITextField!
    @IBOutlet var todoTableView: UITableView!
    
    var _Todos = ["asdfasdf", "adsf"]

    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        textInput.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textInput.text! != "" {
            self._Todos.append(textInput.text!)
            print(_Todos)
            textInput.text! = ""
            self.todoTableView.reloadData()
        }
        
        return false
    }
    

    // TABLEVIEW
    // **************
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _Todos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath) as! UITableViewCell
        
        let row = indexPath.row
        cell.textLabel?.text = _Todos[row]
        return cell
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        print("you  clicked ---- \(_Todos[row]) ")
    }
}

