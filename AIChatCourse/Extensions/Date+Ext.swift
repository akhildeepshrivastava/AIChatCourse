//
//  Date+Ext.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 1/4/25.
//
import Foundation

extension Date {
    func addingTimeInterval(days: Int = 0, hours: Int = 0, minutes: Int = 0) -> Date {
        let totalSeconds = TimeInterval(days * 86400 + hours * 3600 + minutes * 60)
        return self.addingTimeInterval(totalSeconds)
    }
}
