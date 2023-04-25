//
//  StudentManager.swift
//  HomeWork4
//
//  Created by TrungNV (Macbook) on 25/04/2023.
//

import Foundation

class StudentManager {
    var students: [Student] = []
    
    func getStudentCount() -> Int {
        return students.count
    }
    
    func addStudent(_ student: Student) {
        students.append(student)
        print("Đã thêm thành công sinh viên \(student.name), mã sinh viên \(student.studentCode)\n\n")
    }
    
    func updateMathScore(_ index: Int, _ mathScore: Float) {
        var student = students[index]
        student.mathScore = mathScore
        print("Updated: \(students[index].mathScore)")
        print("Cập nhật điểm toán thành công cho sinh viên \(student.name), mã số sinh viên: \(student.studentCode)")
    }
    
    func updatePhysicsScores(_ index: Int, _ physicsScore: Float) {
        var student = students[index]
        student.physicsScore = physicsScore
        print("Cập nhật điểm lý thành công cho sinh viên \(student.name), mã số sinh viên: \(student.studentCode)")
    }
    
    func updateChemistryScores(_ index: Int, _ chemistryScore: Float) {
        var student = students[index]
        student.chemistryScore = chemistryScore
        print("Cập nhật điểm hoá thành công cho sinh viên \(student.name), mã số sinh viên: \(student.studentCode)")
    }
    
    func getStudentFromIndex(_ index: Int) -> Student {
        return students[index]
    }
    
    func printStudentsWithId() {
        for (index, element) in students.enumerated() {
            print("\(index + 1). \(element.name)")
        }
    }
    
    func printStudentsWithMediumScore() {
        students.sort { element1, element2 in
            return element1.getMediumScore() > element2.getMediumScore()
        }
        
        for (index, student) in students.enumerated() {
            print("\(index + 1). \(student.toString())")
        }
    }
}
