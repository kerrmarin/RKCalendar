//
//  RKManager.swift
//  RKCalendar
//
//  Created by Raffi Kian on 7/14/19.
//  Copyright © 2019 Raffi Kian. All rights reserved.
//

import Combine
import SwiftUI

class RKManager : ObservableObject {

    @Published var calendar = Calendar.current
    @Published var minimumDate: Date = Date()
    @Published var maximumDate: Date = Date()
    @Published var selectedDates: [Date] = [Date]()
    @Published var selectedDate: Date! = nil
    @Published var startDate: Date! = nil
    @Published var endDate: Date! = nil
    
    
    init(calendar: Calendar, minimumDate: Date, maximumDate: Date, selectedDates: [Date] = [Date]()) {
        self.calendar = calendar
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
        self.selectedDates = selectedDates
    }
    
    func selectedDatesContains(date: Date) -> Bool {
        if let _ = self.selectedDates.first(where: { Calendar.current.isDate($0, inSameDayAs: date) }) {
            return true
        }
        return false
    }
    
    func selectedDatesFindIndex(date: Date) -> Int? {
        return self.selectedDates.firstIndex(where: { Calendar.current.isDate($0, inSameDayAs: date) })
    }
    
}
