//
//  ContentView.swift
//  reminders
//
//  Created by Sindhu's iPad on 3/2/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    // TODO: Add an @State property to hold a RemindersPage struct
    @State private var page: RemindersPage = RemindersPage(title: "Tasks for 9/14", items: [Reminder(title: "Eat cake!"),Reminder(title: "Dress up"),Reminder(title: "Celebrate!")], color: .pink)
    


    var body: some View {
        NavigationStack{
        VStack {
            // TODO: Add header view
            Text(page.title)
                .font(.largeTitle.bold())
                .foregroundColor(page.color)
                .padding()
            
            List {
                // TODO: Loop through the page's reminders using ForEach
                ForEach($page.items) { $reminder in
                    // TODO: Display each reminder row
                    HStack {
                        Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                reminder.isCompleted.toggle()
                            }
                            .foregroundStyle(page.color)
                            .font(.system(size: 30))

                        
                        Text(reminder.title)
                    }
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            // TODO: Add footer view
            
            
        }
            NavigationLink {
                EditSheet(title: $page.title,
                          selectedColor: $page.color)
            } label: {
                Image(systemName: "gearshape.fill")
                    .foregroundStyle(page.color)
                    .font(.system(size: 30))


            }
    }
        .sheet(isPresented: $isEditing) {
            // TODO: Add remaining binding
            EditSheet(title: $page.title, selectedColor: $page.color)
            
        }
    }
}
