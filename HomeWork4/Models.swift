//
//  Model.swift
//  HomeWork4
//
//  Created by TrungNV (Macbook) on 25/04/2023.
//

import Foundation

struct Student {
    let studentCode: String
    var name: String = ""
    var mathScore: Float = -1.0
    var physicsScore: Float = -1.0
    var chemistryScore: Float = -1.0
    
    init() {
        studentCode = UUID().uuidString
    }
    
    func getMediumScore() -> Float {
        return (mathScore + physicsScore + chemistryScore) / 3.0
    }
    
    func toString() -> String {
        return "\(name)\n   Mã số: \(studentCode)\n   Điểm trung bình: \(getMediumScore())\n\n"
    }
}
