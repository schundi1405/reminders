//
//  Models.swift
//  reminders
//
//  Created by Sindhu's iPad on 3/2/26.
//

//import SwiftUI
//
//struct Reminder: Identifiable {
//    var id: UUID = UUID()
//    var title: String
//    var isCompleted: Bool = false
//}
//
//struct RemindersPage: Identifiable {
//    var id: UUID = UUID()
//    var title: String
//    var items: [Reminder]
//    var color: Color
//}

import SwiftUI

struct Reminder: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String //
    var date: Date  //
    var isCompleted: Bool = false
}

struct RemindersPage: Identifiable {
    var id: UUID = UUID()
    var title: String
    var items: [Reminder]
    var color: Color
}
