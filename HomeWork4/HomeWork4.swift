//
//  HomeWork4.swift
//  HomeWork4
//
//  Created by TrungNV (Macbook) on 25/04/2023.
//

import Foundation

class HomeWork4 {
    /**
     Viết một ứng dụng cho phép quản lý danh sách điểm thi của các sinh viên. Mỗi sinh viên sẽ có thông tin như sau: Tên, mã sinh viên, điểm toán, điểm lý, điểm hóa.
     Ứng dụng cho phép thêm mới sinh viên, cập nhật điểm số của sinh viên, hiển thị danh sách sinh viên theo thứ tự điểm trung bình giảm dần. Sử dụng Struct.
     */
    let studentManager = StudentManager()
    
    func exercise1() {
        handleUserSelector()
    }
    
    private func handleUserSelector() {
        print("Chọn 1 trong các mục bên dưới bằng cách gõ số và enter")
        print("1. Thêm mới sinh viên")
        print("2. Cập nhật điểm số theo mã số sinh viên")
        print("3. Hiển thị danh sách sinh viên theo thứ tự điểm trung bình giảm dần")
        
        let keyCode = Int(readLine() ?? "0") ?? 0
        if (1 ... 3).contains(keyCode) {
            switch keyCode {
            case 1:
                var student = Student()
                handleInputStudent(&student)
                studentManager.addStudent(student)
                handleUserSelector()
                break
            case 2:
                if studentManager.getStudentCount() == 0 {
                    print("Chưa có sinh viên nào, vui lòng thêm sinh viên trước!")
                    handleUserSelector()
                } else {
                    print("Nhập số thứ tự của sinh viên muốn cập nhật")
                    studentManager.printStudentsWithId()
                    var studentIndex = 0
                    var subjectId = -1
                    handleUpdateScore(&studentIndex, &subjectId)
                }
                break
            default:
                if studentManager.getStudentCount() == 0 {
                    print("Không có sinh viên nào trong danh sách, vui lòng thêm sinh viên trước!")
                } else {
                    studentManager.printStudentsWithMediumScore()
                    handleUserSelector()
                }
                break
            }
        } else {
            print("Program exited")
        }
    }
    
    private func handleUpdateScore(_ studentIndex: inout Int, _ subjectId: inout Int) {
        if studentIndex == 0 {
            studentIndex = Int(readLine() ?? "0") ?? 0
        }
        
        if studentIndex <= 0 || studentIndex > studentManager.getStudentCount() {
            print("Vui lòng nhập đúng số thứ tự của sinh viên trong danh sách trên!")
            print("Nhập số thứ tự của sinh viên muốn cập nhật")
            handleUpdateScore(&studentIndex, &subjectId)
        } else {
            print("Nhập số thứ tự của môn bạn muốn cập nhật:")
            print("1. Toán")
            print("2. Lý")
            print("3. Hoá")
            subjectId = Int(readLine() ?? "0") ?? 0
            
            if (1 ... 3).contains(subjectId) {
                print("Nhập số điểm muốn cập nhật: ", terminator: "")
                let score = Float(readLine() ?? "-1") ?? -1
                if (0.0 ... 10.0).contains(score) {
                    switch subjectId {
                    case 1:
                        studentManager.updateMathScore(studentIndex - 1, score)
                        break
                    case 2:
                        studentManager.updatePhysicsScores(studentIndex - 1, score)
                        break
                    default:
                        studentManager.updateChemistryScores(studentIndex - 1, score)
                        break
                    }
                    handleUserSelector()
                } else {
                    print("Điểm phải là 1 số trong đoạn [0, 10]. Vui lòng nhập lại!")
                    handleUpdateScore(&studentIndex, &subjectId)
                }
            } else {
                print("Vui lòng nhập đúng số thứ tự môn muốn cập nhật!")
                handleUpdateScore(&studentIndex, &subjectId)
            }
        }
        
    }
    
    private func handleInputStudent(_ student: inout Student) {
        if student.name.isEmpty {
            print("Nhập tên sinh viên: ", terminator: "")
            let name = readLine() ?? ""
            
            if name.isEmpty {
                print("Tên sinh viên không được trống, vui lòng nhập lại!")
                handleInputStudent(&student)
                return
            } else {
                student.name = name
            }
        }
        
        if student.mathScore == -1 {
            print("Nhập điểm toán: ", terminator: "")
            let mathScore = Float(readLine() ?? "-1") ?? -1
            if mathScore < 0 || mathScore > 10 {
                print("Điểm toán phải là 1 số trong đoạn [0, 10]. Vui lòng nhập lại!")
                handleInputStudent(&student)
                return
            } else {
                student.mathScore = mathScore
            }
        }
        
        if student.physicsScore == -1 {
            print("Nhập điểm lý: ", terminator: "")
            let physicsScore = Float(readLine() ?? "-1") ?? -1
            if physicsScore < 0 || physicsScore > 10 {
                print("Điểm lý phải là 1 số số trong đoạn [0, 10]. Vui lòng nhập lại!")
                handleInputStudent(&student)
                return
            } else {
                student.physicsScore = physicsScore
            }
        }
        
        if student.chemistryScore == -1 {
            print("Nhập điểm hoá: ", terminator: "")
            let chemistryScore = Float(readLine() ?? "-1") ?? -1
            if chemistryScore < 0 || chemistryScore > 10 {
                print("Điểm hoá phải là 1 số trong đoạn [0, 10]. Vui lòng nhập lại!")
                handleInputStudent(&student)
                return
            } else {
                student.chemistryScore = chemistryScore
            }
        }
    }
}
