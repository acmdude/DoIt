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
    
    //var previousVC = TasksViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addTapped(_ sender: AnyObject) {
        
        //Create new task when Add buttom tapped.  Then add task to array in other viewController.
        
        //Add this to set for CoreData
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        //End add for CoreData
        
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        //Save the new task
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //previousVC.tasks.append(task)
        //previousVC.tableView.reloadData()
        //Pop the previous view controller
        navigationController!.popViewController(animated: true)
        
        
        
    }
    
    
    
    
    
}
