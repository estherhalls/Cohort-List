//
//  Student.swift
//  CohortList
//
//  Created by Esther on 9/20/22.
//

import Foundation
class Student: Equatable{
    var name: String
    var cohortID: Int
    var studentDescription: String
    init(name: String, cohortID: Int, studentDescription: String){
        self.name = name
        self.cohortID = cohortID
        self.studentDescription = studentDescription
    }

    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name &&
        lhs.cohortID == rhs.cohortID &&
        lhs.studentDescription == rhs.studentDescription
    }
}
