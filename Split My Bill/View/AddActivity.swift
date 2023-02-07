//
//  AddActivity.swift
//  Split My Bill
//
//  Created by Putut Yusri Bahtiar on 06/02/23.
//

import SwiftUI

struct AddActivity: View {
    @ObservedObject var data: Connection
    @State private var amount = 0
    @State private var currency = "USD"
    @State private var description = ""
    @State private var numberOfPeople = 2
    @State private var title = ""
    @State private var tipsPercentage = 0
    
    let currencies = ["USD", "EUR", "IDR", "JPY"]
    let tipsPercentages = [0, 10, 15, 20, 25]
    
    @Environment(\.dismiss) var dismiss
    
    var totalPerson: Int {
        let checkAmount = Int(amount)
        let checkNumberOfPeople = Int(numberOfPeople + 2)
        
        let totalTips = checkAmount / 100 * tipsPercentage
        let grandTotal = totalTips + amount
        let payPerPerson = grandTotal / checkNumberOfPeople
        
        return payPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    
                    Picker("Number Of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    TextField("Amount", value: $amount, format: .currency(code: currency))
                    
                    Picker("Currency", selection: $currency) {
                        ForEach(currencies, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Amount")
                }
                
                Section {
                    Picker("Tips", selection: $tipsPercentage) {
                        ForEach(tipsPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How Much Tips ?")
                }
                
                Section {
                    Text("\(totalPerson , format: .currency(code: currency))")
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("Add Data")
            .toolbar {
                Button("Save") {
                    let activity = Activity(title: title, description: description, amount: amount, numberOfPeople: numberOfPeople, tipsPercentage: tipsPercentage, currency: currency)
                    data.activity.append(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(data: Connection())
    }
}
