//
//  ActivityView.swift
//  Split My Bill
//
//  Created by Putut Yusri Bahtiar on 07/02/23.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var data: Connection
    var activity: Activity
    
    var body: some View {
        List {
            Section {
                if activity.description.isEmpty == false {
                    Text(activity.description)
                }
                
                Text("Number of People : \(activity.numberOfPeople + 2)")
            }
            
            Section {
                Text("Amount :\(activity.amount, format: .currency(code: activity.currency))")
                Text("Tips : \(activity.tipsPercentage, format: .percent)")
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(data: Connection(), activity: Activity.example)
    }
}
