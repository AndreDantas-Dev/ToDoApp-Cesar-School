//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by aluno on 20/06/20.
//  Copyright © 2020 aluno. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

        self.tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    @IBAction func goToCreateTask(_ sender: UIBarButtonItem) {
         let create = CreateTaskViewController(nibName: "CreateTask", bundle: nil)

        navigationController?.pushViewController(create, animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserDefaults.standard.stringArray(forKey: "tasks")?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoTableViewCell


        let tasks = UserDefaults.standard.stringArray(forKey: "tasks")
        cell.taskLabel.text =  tasks?[indexPath.row] ?? ""
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let create = CreateTaskViewController(nibName: "CreateTask", bundle: nil)
            let tasks = UserDefaults.standard.stringArray(forKey: "tasks")
               create.taskIndex = indexPath.row
               create.taskName = tasks?[indexPath.row]
               navigationController?.pushViewController(create, animated: true)
    }

    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            var tasks = UserDefaults.standard.stringArray(forKey: "tasks")
            tasks?.remove(at: indexPath.row)
            UserDefaults.standard.set(tasks, forKey: "tasks")
            
            tableView.endUpdates()
        }
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
