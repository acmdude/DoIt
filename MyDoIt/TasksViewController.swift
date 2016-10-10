//
//  TasksViewController.swift
//  MyDoIt
//
//  Created by Angelo Micheletti on 9/22/16.
//  Copyright © 2016 Angelo Micheletti. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
   // var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate  = self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
        }
        else {
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //selectedIndex = indexPath.row
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func plusTapped(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            try tasks = context.fetch(Task.fetchRequest()) as! [Task]
            //print(tasks)
        }
        catch {
            print("OOPS Have an error")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        /*  if segue.identifier == "addSegue"
         {
         let nextVC = segue.destination as! CreateTaskViewController
         } */
        
        if segue.identifier == "selectTaskSegue"
        {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
            //nextVC.previousVC = self
        }
    }
    
}
