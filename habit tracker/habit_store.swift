import Foundation

struct Habit: Identifiable, Codable {
    let id: UUID
    var name: String
    var description: String
    var streak: Int
    var record: Int
}

class HabitStore: ObservableObject {
    @Published var habits: [Habit] = []

    func addHabit(name: String, description: String, streak: Int, record: Int) {
        let newHabit = Habit(id: UUID(), name: name, description: description, streak: streak, record: record)
        habits.append(newHabit)
    }
}
