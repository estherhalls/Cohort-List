//
//  StudentListTableViewController.swift
//  CohortList
//
//  Created by Esther on 9/20/22.
//

import UIKit

class StudentListTableViewController: UITableViewController {
  
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
   }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StudentController.sharedInstance.students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
        let students = StudentController.sharedInstance.students
        
        let studentToDisplay = students[indexPath.row]
        cell.textLabel?.text = studentToDisplay.name
        cell.textLabel?.text?.append(":\(students[indexPath.row].cohortID)")

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let student = StudentController.sharedInstance.students[indexPath.row]
            
            StudentController.sharedInstance.delete(deleteStudent: student)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
    
        }    
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let destination = segue.destination as? StudentDetailViewController,
               let indexPath = tableView.indexPathForSelectedRow {
                let studentToPass = StudentController.sharedInstance.students[indexPath.row]
                destination.student = studentToPass
        
            }
        }
 
    }
 

}
