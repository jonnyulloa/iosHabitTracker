//
//  habit_trackerApp.swift
//  habit tracker
//
//  Created by buzz ulloa on 9/15/24.
//

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
