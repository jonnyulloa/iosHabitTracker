import SwiftUI

struct ContentView: View {
    @ObservedObject var habitStore: HabitStore

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("King Streaks")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    NavigationLink(destination: NewHabit(habitStore: habitStore)) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                }
                .padding()

                Spacer()

                habitList
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
    private var habitList: some View {
        List {
            ForEach(habitStore.habits) { habit in
                VStack(alignment: .center) {
                    HStack(alignment: .center) {
                        Text(habit.name)
                            .font(.headline)
                        if habit.streak >= habit.record {
                            Text("\(habit.streak)⭐️")
                        } else {
                            Text("\(habit.streak)🔥")
                        }
                        Text("\(habit.record)🏆")
                        Spacer()
                        Button(action: {
                            habitStore.decrementStreak(for: habit.id)
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .buttonStyle(PlainButtonStyle())
                        Button(action: {
                            habitStore.incrementStreak(for: habit.id)
                        }) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    Text("\(habit.description)")
                        .font(.subheadline)
                    VStack {
                        HStack {
                            Spacer()
                            NavigationLink(destination: NewHabit(habitStore: habitStore)) {
                                Text("Add")
                                
                            }
                            .padding()
                        }
                        Spacer()
                    }
                    VStack {
                        HStack {
                            Spacer()
                            NavigationLink(destination: NewHabit(habitStore: habitStore)) {
                                Text("Add")
                                
                            }
                            .padding()
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView(habitStore: HabitStore())
}

