//
//  StudentDetailViewController.swift
//  CohortList
//
//  Created by Esther on 9/22/22.
//

import UIKit

class StudentDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var cohortTextField: UITextField!
    @IBOutlet weak var studentDescriptionTextView: UITextView!
    @IBOutlet weak var studentNameTextField: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // Receiver:
    var student: Student?
    
    // Helping Function:
    func updateViews() {
        guard let student = student else {return}
        cohortTextField.text = student.name
        studentDescriptionTextView.text = student.studentDescription
        studentNameTextField.text = student.name
        
    }
    
    func clearData(){
        cohortTextField.text = ""
        studentDescriptionTextView.text = ""
        studentNameTextField.text = ""
        
    }
    
    //MARK: - Actions:
    @IBAction func clearButtonTapped(_ sender: Any) {
        clearData()
    }
    @IBAction func deleteButtonTapped(_ sender: Any) {
        if let student = student {
            StudentController.sharedInstance.delete(deleteStudent: student)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = studentNameTextField.text,
              let cohortNumber = cohortTextField.text,
              let studentCohortNum = Int(cohortNumber),
              let studentDescription = studentNameTextField.text else {return}
        if let studentReciever = student {
            //has value - user wants to update
            StudentController.sharedInstance.update(updateStudent: studentReciever, newName: name, newCohort: studentCohortNum, newStudentDetails: studentDescription)
        } else {
            //does not have value - user wants to create new
            StudentController.sharedInstance.createStudent(name: name, cohortID: studentCohortNum, studentDescription: studentDescription)
        }
        self.navigationController?.popViewController(animated: true)
    }
   
    

}// End of Class
