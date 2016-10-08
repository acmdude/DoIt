//
//  CreateTaskViewController.swift
//  MyDoIt
//
//  Created by Angelo Micheletti on 9/24/16.
//  Copyright © 2016 Angelo Micheletti. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addTapped(_ sender: AnyObject) {
        
        //Create new task when Add buttom tapped.  Then add task to array in other viewController.
        
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
        
        
    }
    
    
    
    
    
}
