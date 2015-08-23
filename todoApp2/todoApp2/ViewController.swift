//
//  ViewController.swift
//  todoApp2
//
//  Created by jonny on 7/19/15.
//  Copyright (c) 2015 jonny kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
    UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoText.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var todoTableView: UITableView!
    @IBOutlet var todoText: UITextField!
    
    var _Todos = ["hello", "Nancy"]
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if todoText.text! != "" {
            self._Todos.append(todoText.text!)
            print(_Todos)
            todoText.text! = ""
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

