//
//  FlightsModel.swift
//  AeroNetz
//
//  Created by Victor Levenetz Mariano on 05/10/24.
//

import Foundation


//MARK: Object Model
struct FlightModel: Codable,Identifiable {
   
    let flightId: String
    let status: String
    let completionStatus: FlightStatus
    let startDate: Date
    let endDate: Date
    let departureTime: Date
    let arrivalTime: Date
    let departureAirport: String
    let arrivalAirport: String
    let airplaneName: String
    var id: String {flightId}
    
    
    
    enum FlightStatus: String, Codable {
        case completed = "CONCLUIDO"
        case onTime = "NO_HORARIO"
        case late = "ATRASOU"
        case canceled = "CANCELADO"
        
    }
}




