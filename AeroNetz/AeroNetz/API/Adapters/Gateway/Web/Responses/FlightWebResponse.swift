//
//  FlightWebResponse.swift
//  WaiAirlines
//
//  Created by Victor Levenetz Mariano on 05/10/24.
//

import Foundation

//MARK: Response api Class
struct FlightsResponse: Codable {
    let flights: [FlightWebResponse]
}

//API OBJECT
struct FlightWebResponse: Codable{

    
    let flightId: String
    let status: String
    let completionStatus: String
    let startDate: String
    let endDate: String
    let departureTime: String
    let arrivalTime: String
    let departureAirport: String
    let arrivalAirport: String
    let airplaneName: String
    var id: String {flightId}
    
    enum CodingKeys: String, CodingKey {
        case flightId = "flight_id"
        case status
        case completionStatus = "completion_status"
        case startDate = "start_date"
        case endDate = "end_date"
        case departureTime = "departure_time"
        case arrivalTime = "arrival_time"
        case departureAirport = "departure_airport"
        case arrivalAirport = "arrival_airport"
        case airplaneName = "airplane_name"
    }
}

