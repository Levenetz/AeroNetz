//
//  FlightConverter.swift
//  WaiAirlines
//
//  Created by Victor Levenetz Mariano on 05/10/24.
//

import Foundation



class FlightConverter {
    
    //MARK: "Class to convert Response Object to model object."

    func convertToModel(res:  [FlightWebResponse])-> [FlightModel]{
        return res.map { flight in
            convertToModel(res: flight)
        }
    }
    
    
    func convertToModel(res: FlightWebResponse)-> FlightModel{
        
        let dateFormatterWithTime = DateFormatter()
        dateFormatterWithTime.dateFormat = "yyyy-MM-dd HH:mm" /// Data e hora atuais
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
       
        
        let completionStatus = FlightModel.FlightStatus(rawValue: res.completionStatus)!
        
        let startDate =  dateFormatter.date(from: res.startDate)!
        let endDate =  dateFormatter.date(from: res.endDate)!
        
        let flightDepartureString = "\(res.startDate) \(res.departureTime)"
        let departureTime = dateFormatterWithTime.date(from: flightDepartureString)!
        
        
        let flightArrivalString = "\(res.endDate) \(res.arrivalTime)"
        let arrivalTime = dateFormatterWithTime.date(from: flightArrivalString)!
        
        let object = FlightModel(
            flightId: res.flightId,
            status: res.status,
            completionStatus: completionStatus,
            startDate: startDate,
            endDate: endDate,
            departureTime: departureTime,
            arrivalTime: arrivalTime,
            departureAirport: res.departureAirport,
            arrivalAirport: res.arrivalAirport,
            airplaneName: res.airplaneName
        )
        
        return object
    }
}

