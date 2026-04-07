//
//  ContentView.swift
//  reminders
//
//  Created by Sindhu's iPad on 3/2/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    @State private var page: RemindersPage = RemindersPage(
            title: "Tasks for 9/14",
            items: [
                Reminder(title: "Eat cake!", description: "", date: Date()),
                Reminder(title: "Dress up", description: "", date: Date()),
                Reminder(title: "Celebrate!", description: "", date: Date())
            ],
            color: .pink
        )
    
    var body: some View {
            NavigationStack {
                List {
                    ForEach($page.items) { $reminder in
                        NavigationLink {
                            ReminderDetailView(
                                title: $reminder.title,
                                description: $reminder.description,
                                date: $reminder.date,
                                isEditing: $isEditing
                            )
                        } label: {
                            HStack {
                                Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(page.color)
                                    .font(.system(size: 30))
                                    .onTapGesture {
                                        reminder.isCompleted.toggle()
                                    }
                                
                                VStack(alignment: .leading) {
                                    TextField("Reminder title", text: $reminder.title)
                                        .font(.headline)
                                    
                                    Text(reminder.date.relativeTime)
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .onDelete { indexSet in
                        page.items.remove(atOffsets: indexSet)
                    }
                }
                .listStyle(.plain)
                .navigationTitle(page.title)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isEditing = true
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .foregroundStyle(page.color)
                                .font(.system(size: 25))
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            addNewReminder()
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(page.color)
                                .font(.system(size: 25))
                        }
                    }
                }
                .sheet(isPresented: $isEditing) {
                    EditSheet(title: $page.title, selectedColor: $page.color)
                }
            }
        }
        
// how to add a new rem
        private func addNewReminder() {
            let newReminder = Reminder(title: "", description: "", date: Date())
            page.items.append(newReminder)
        }
    }

// date stuff
    extension Date {
        var relativeTime: String {
            let formatter = RelativeDateTimeFormatter()
            formatter.unitsStyle = .short
            return formatter.localizedString(for: self, relativeTo: Date())
        }
    }

