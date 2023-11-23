//
//  Date+Convert.swift
//  AsaVax
//
//  Created by Gilberto Magno on 22/11/23.
//

import Foundation

extension Date {
    func dateStringISOFormat() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            
            return dateFormatter.string(from: self)
        }
}

extension String {
    func dateFromISOFormatString() -> Date? {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
           dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

           return dateFormatter.date(from: self)
    }
}

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)
        
        return numberOfDays.day!
    }
}
