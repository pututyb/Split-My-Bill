//
//  ContentView.swift
//  Split My Bill
//
//  Created by Putut Yusri Bahtiar on 03/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = Connection()
    @State private var addingNewActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.activity) { activities in
                    NavigationLink {
                        ActivityView(data: data, activity: activities)
                    } label: {
                        HStack {
                            Text(activities.title)
                        }
                    }
                }.onDelete(perform: remove)
            }
            .navigationTitle("Split Bill")
            .toolbar {
                Button {
                    addingNewActivity.toggle()
                }label: {
                    Label("Add new activity", systemImage: "plus")
                }
            }
        }.sheet(isPresented: $addingNewActivity) {
            AddActivity(data: data)
        }
    }
    
    func remove(at offsets: IndexSet) {
        data.activity.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
