//
//  StudentController.swift
//  CohortList
//
//  Created by Esther on 9/20/22.
//

import Foundation

class StudentController{
// MARK: - Singleton
    static let sharedInstance = StudentController()

// MARK: - Source of Truth
    var students: [Student] = []
    
// MARK: - CRUD

// CREATE
    func createStudent(name: String, cohortID: Int, studentDescription: String) {
        let newStudent = Student(name: name, cohortID: cohortID, studentDescription: studentDescription)
        students.append(newStudent)
        
    } // End of Func
// REUSE

// UPDATE
    func update(updateStudent: Student, newName: String, newCohort: Int, newStudentDetails: String) {
        updateStudent.name = newName
        updateStudent.cohortID = newCohort
        updateStudent.studentDescription = newStudentDetails
    }
// DELETE
    func delete(deleteStudent:Student) {
        guard let index = students.firstIndex(of: deleteStudent) else {return}
        students.remove(at: index)
        
    }
} // End of Class
