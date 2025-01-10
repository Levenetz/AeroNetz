//
//  Date.swift
//  WaiAirlines
//
//  Created by Victor Levenetz Mariano on 05/10/24.
//

import Foundation

struct Event {
    var startDate: Date
    var endDate: Date
    var departureTime: Date
    var arrivalTime: Date
    
    func parseEvent(from json: [String: String]) -> Event? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Para datas
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm" // Para horários

        guard let startDate = dateFormatter.date(from: json["start_date"] ?? ""),
              let endDate = dateFormatter.date(from: json["end_date"] ?? ""),
              let departureTime = timeFormatter.date(from: json["departure_time"] ?? ""),
              let arrivalTime = timeFormatter.date(from: json["arrival_time"] ?? "") else {
            return nil // Retorna nil se a conversão falhar
        }

        return Event(startDate: startDate, endDate: endDate, departureTime: departureTime, arrivalTime: arrivalTime)
    }
}
