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
}
