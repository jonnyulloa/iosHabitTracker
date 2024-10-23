//
//  ContentView.swift
//  habit tracker
//
//  Created by buzz ulloa on 9/15/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habitStore: HabitStore

    var body: some View {
        NavigationView {
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination: NewHabit(habitStore: habitStore)) {
                            Text("Add")
                            
                        }
                        .padding()
                    }
                    Spacer()
                    habitList
                }
        }
    }
    private var habitList: some View {
        List {
            ForEach(habitStore.habits) { habit in
                VStack(alignment: .leading) {
                    Text(habit.name)
                        .font(.headline)
                    Text("Description: \(habit.description)")
                    Text("Streak: \(habit.streak)")
                    Text("Record: \(habit.record)")
                }
            }
        }
    }
}

#Preview {
    ContentView(habitStore: HabitStore())
}

