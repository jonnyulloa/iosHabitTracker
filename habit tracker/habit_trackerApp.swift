import SwiftUI

@main
struct HabitTrackerApp: App {
    @StateObject private var habitStore = HabitStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(habitStore: habitStore)

        }
    }
}
