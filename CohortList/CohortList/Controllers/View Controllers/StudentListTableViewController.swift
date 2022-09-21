//
//  StudentListTableViewController.swift
//  CohortList
//
//  Created by Esther on 9/20/22.
//

import UIKit

class StudentListTableViewController: UITableViewController {
    @IBOutlet weak var enterStudentNameTitle: UITextField!
    @IBOutlet weak var enterCohortIDLabel: UITextField!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.enterStudentNameTitle.delegate = self
//        self.enterCohortIDLabel.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func addButtonClicked(_ sender: Any) {
        createStudent()
//        emptyTextField()
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StudentController.sharedInstance.students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        let students = StudentController.sharedInstance.students[indexPath.row]
        let studentToDisplay = students
        cell.textLabel?.text = studentToDisplay.name
        cell.detailTextLabel?.text = studentToDisplay.cohortID
    

        // Configure the cell...

        return cell
    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        emptyTextField()
//        createStudent()
//
//        return true
//
//    }
//    func emptyTextField() {
//        enterStudentNameTitle.text = ""
//        enterCohortIDLabel.text = ""
//    }
    
    func createStudent() {
        guard let studentNameInput = enterStudentNameTitle.text else {return}
        guard let cohortIDInput = enterCohortIDLabel.text else {return}
        StudentController.sharedInstance.createStudent(name: studentNameInput, cohortID: cohortIDInput)
        
        
        
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
