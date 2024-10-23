import Foundation
import SwiftUI

struct NewHabit: View {
    @ObservedObject var habitStore: HabitStore
    
    @State private var newHabitName: String = ""
    @State private var newHabitDescription: String = ""
    @State private var newHabitStreak: String = ""
    @State private var newHabitRecord: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                habitForm
//                habitList
            }
            .navigationTitle("Habit Tracker")
        }
    }
    
    private var habitForm: some View {
        Form {
            Section(header: Text("Add New Habit")) {
                TextField("Name", text: $newHabitName)
                TextField("Description", text: $newHabitDescription)
                numberField("Current Streak", text: $newHabitStreak)
                numberField("Best Record", text: $newHabitRecord)
                
                Button("Submit") {
                    addNewHabit()
                }
            }
        }
    }

    // Helper to create a number field with validation
    private func numberField(_ label: String, text: Binding<String>) -> some View {
        TextField(label, text: Binding(
            get: { text.wrappedValue },
            set: { value in text.wrappedValue = value.filter { $0.isWholeNumber } }
        ))
        .keyboardType(.numberPad)
    }
    
    // Simplify the logic for adding a new habit and clearing the form
    private func addNewHabit() {
        if let streak = Int(newHabitStreak), let record = Int(newHabitRecord) {
            habitStore.addHabit(name: newHabitName, description: newHabitDescription, streak: streak, record: record)
            clearForm()
        }
    }
    
    private func clearForm() {
        newHabitName = ""
        newHabitDescription = ""
        newHabitStreak = ""
        newHabitRecord = ""
    }
}

#Preview {
    NewHabit(habitStore: HabitStore())
}
