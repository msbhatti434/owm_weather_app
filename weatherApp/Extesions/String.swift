//
//  String.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 31/07/2024.
//

import Foundation

extension String {
    func toDayInitials() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: self) else { return "" }
        
        formatter.dateFormat = "E"
        return formatter.string(from: date)
    }
}
