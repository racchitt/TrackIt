//
//  Transaction.swift
//  TrackIt-ExpenseTracker
//
//  Created by Shivam Sultaniya on 10/06/24.
//

import SwiftUI

struct Transaction: Identifiable{
    let id: UUID = .init()
    
    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var category: String
    var tintColor: String
    
    
    init(title: String, remarks: String, amount: Double, dateAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }
    
    var color: Color{
        return tints.first(where: { $0.color == tintColor })?.value ?? .blue
    }
}

var sampleTransactions: [Transaction] = [
    .init(title: "VIT FEES", remarks: "Tuition Fees", amount: 500000, dateAdded: .now.startOfMonth, category: .expense, tintColor: tints.randomElement() ?? tints[0]),
    .init(title: "Travellings", remarks: "Nepal Trip", amount: 100000, dateAdded: .now.startOfMonth, category: .expense, tintColor: tints.randomElement() ?? tints[0]),
    .init(title: "Freelancing", remarks: "Web developer", amount: 10000, dateAdded: .now.startOfMonth, category: .income, tintColor: tints.randomElement() ?? tints[0]),
    .init(title: "Salary", remarks: "Salary Credited", amount: 100000, dateAdded: .now.startOfMonth, category: .income, tintColor: tints.randomElement() ?? tints[0])
]
