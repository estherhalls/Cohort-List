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
    func createStudent(name: String, cohortID: String) {
        let newStudent = Student(name: name, cohortID: cohortID)
        students.append(newStudent)
        
    } // End of Func
// REUSE

// UPDATE

// DELETE
} // End of Class
