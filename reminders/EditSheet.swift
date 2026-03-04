//
//  EditSheet.swift
//  reminders
//
//  Created by Sindhu's iPad on 3/2/26.
//
import SwiftUI

struct EditSheet: View {
    @Binding var title: String
    @Binding var selectedColor: Color
    
    var body: some View {
        VStack(spacing: 20) {
            // TODO: Add list.bullet.circle.fill icon and TextField
            Image(systemName: "list.bullet.circle.fill")
                .font(.system(size: 30))
                
            TextField("List Title", text: $title)
                .textFieldStyle(.roundedBorder)

            
            
            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}


#Preview {
    @Previewable @State var selectedColor: Color = .red
    @Previewable @State var title: String = "Reminder"
    
    EditSheet(title: $title, selectedColor: $selectedColor)
        .preferredColorScheme(.dark)
}
