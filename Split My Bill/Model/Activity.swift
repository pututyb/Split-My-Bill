//
//  Activity.swift
//  Split My Bill
//
//  Created by Putut Yusri Bahtiar on 03/02/23.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var amount: Int
    var numberOfPeople: Int
    var tipsPercentage: Int
    var currency: String
    
    static let example = Activity(title: "Title", description: "Description", amount: 0, numberOfPeople: 0, tipsPercentage: 0, currency: "USD")
}
