//
//  CreateTaskViewController.swift
//  TodoApp
//
//  Created by aluno on 21/06/20.
//  Copyright © 2020 aluno. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    var taskName : String?
    var taskIndex : Int = -1
    private var edit = false
    override func viewDidLoad() {
        super.viewDidLoad()
        if (taskName != nil){
            taskField.text = taskName
            edit = true
        }
        else{
            taskName = ""
        }
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var taskField: UITextField!
    
    @IBAction func saveTask(_ sender: Any) {
        finishEdit()
    }
    func finishEdit(){
        taskName = taskField?.text ?? ""
        if(taskName == nil || taskName?.trimmingCharacters(in:.whitespacesAndNewlines) == ""){
            return
        }
        
        if(edit){
            //tableView?.tasks[taskIndex] = taskName!
            var tasks = UserDefaults.standard.stringArray(forKey: "tasks") ?? []
            tasks[taskIndex] = taskName!
            UserDefaults.standard.set(tasks, forKey: "tasks")
        }
        else{
            //tableView?.tasks.append(taskName!)
            var tasks = UserDefaults.standard.stringArray(forKey: "tasks") ?? []
            tasks.append(taskName!)
            UserDefaults.standard.set(tasks, forKey: "tasks")
        }
        
        navigationController?.popViewController(animated: true)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
