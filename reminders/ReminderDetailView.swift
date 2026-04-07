//
//  ReminderDetailView.swift
//  reminders
//
//  Created by Sindhu's iPad on 4/6/26.
//

import SwiftUI

struct ReminderDetailView: View {
    
    // TODO: Fill in necessary bindings (Hint: you need 4)
    @Binding var title: String
    @Binding var description: String //
    @Binding var date: Date
    @Binding var isEditing: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // Title & Description Section
            Text("Title & Description")
                .foregroundColor(.red)
                .bold()
            
            VStack(alignment: .leading, spacing: 10) {
                TextField("Title", text: $title)
                    .font(.title2)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Description", text: $description)
                    .font(.body)
                    .textFieldStyle(.roundedBorder)
            }
            
            // Date Section
            Text("Date")
                .foregroundColor(.red)
                .bold()
            
            HStack {
                DatePicker("", selection: $date, displayedComponents: [.date, .hourAndMinute])
                    .labelsHidden()
            }
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $isEditing) {
            VStack {
                Text("Edit Reminder")
                    .font(.title)
                    .bold()
                
                TextField("Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Description", text: $description)
                    .textFieldStyle(.roundedBorder)
                
                DatePicker("Date", selection: $date)
                
                Button("Done") {
                    isEditing = false
                }
                .padding()
            }
            .padding()
        }
        
        //TODO: Add NavigationTitle
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ReminderDetailView(
            title: .constant("Sample Title"),
            description: .constant("This is a sample description."),
            date: .constant(Date()),
            isEditing: .constant(false)
        )
    }
}















