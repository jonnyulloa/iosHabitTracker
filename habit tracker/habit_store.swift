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
    func incrementStreak(for habitID: UUID) {
        if let index = habits.firstIndex(where: { $0.id == habitID }) {
            habits[index].streak += 1
        }
    }
    func decrementStreak(for habitID: UUID) {
        if let index = habits.firstIndex(where: { $0.id == habitID }), habits[index].streak > 0 {
            habits[index].streak -= 1
        }
    }
}
