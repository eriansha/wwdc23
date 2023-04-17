//
//  Angklung.swift
//  Ngklung
//
//  Created by Ivan on 14/04/23.
//

import Foundation

struct Angklung: Identifiable, Hashable {
    var id: UUID = UUID()
    var order: Int
    var soundPath: String
    var imagePath: String
    
    func getNumericNotation() -> String {
        switch self.order {
        case 1:
            return "Do"
        case 2:
            return "Re"
        case 3:
            return "Mi"
        case 4:
            return "Fa"
        case 5:
            return "Sol"
        case 6:
            return "La"
        case 7:
            return "Si"
        case 8:
            return "Do"
        default:
            return ""
        }
    }
}
