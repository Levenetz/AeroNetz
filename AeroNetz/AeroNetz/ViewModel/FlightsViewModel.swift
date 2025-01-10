//
//  FlightsViewModel.swift
//  AeroNetz
//
//  Created by Victor Levenetz Mariano on 05/10/24.
//

import Foundation
import SwiftUI

class FlightsViewModel: ObservableObject {
    
    //var dates
    @State var selectedStartDate: Date?
    @State var selectedEndDate: Date?
    
    
    //Principal populed Array
    @Published var flights: [FlightModel] = []
    
    @Published var errorMessage: String?
    
    //Var to filter and picker management
    @Published var selectedStatus: String = "All" // Status padrão
    
    //Instance of API
    private var webGateway = WebGateway()
    
    
    //MARK: Fetch itens func
    func fetchFlights() {
        webGateway.fetchFlights { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let flights):
                    self.flights = flights
                   
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    
    
    //MARK: Filtered array
    var filteredFlights: [FlightModel] {
        guard selectedStatus != "All" else {
            return flights
        }
        
        let today = Date() // Data e hora atuais
        
        // Filtra os voos com base no status selecionado.
        return flights.filter { flight in
            switch selectedStatus {
                
            case "Now": // "Filter flights whose date is now."
                return today >= flight.departureTime && today <= flight.arrivalTime
                
            case "Future": // "Filter flights whose date is in the future."
                return flight.departureTime > today
                
            case "Completed":  // Filter flights whose completion status is Completed
                return flight.status == FlightModel.FlightStatus.completed.rawValue
                
            case "Canceled": //Filter flights whose completion status is Canceled
                
                return flight.status == FlightModel.FlightStatus.canceled.rawValue
            default:
                //
                return flight.status == selectedStatus
            }
        }
        
    }

    //MARK: Funcs to return color to Components in [LIST]
    
    func colorForCompletionStatus(status: FlightModel) -> Color {
        switch status.completionStatus {
        case .completed:
              return  .green
        case .onTime:
            return .green
        case .late:
            return .yellow
        case .canceled:
            return .red.opacity(0.6)
        }
    }

    func colorForStatus(status: FlightModel) -> Color {
        switch status.completionStatus {
        case .completed:
              return  .green
        case .canceled:
            return .red.opacity(0.6)
        default:
            return .green
        }
    }
    
  //MARK: Func to return String for visual adjustment [LIST]
    func stringForCompletionStatus(status: FlightModel) -> String {
        switch status.completionStatus {
        case .completed:
              return  "Concluído"
        case .onTime:
            return  "No horário"
        case .late:
            return  "Atrasou"
        case .canceled:
            return  "Cancelado"
        }
    }
    

    func stringForStatus(status: FlightModel) -> String {
        switch status.status {
        case "CONCLUIDO":
              return  "Concluído"
        case "CANCELADO":
            return  "Cancelado"
      
        default:
            return ""
        }
    }
    
    //MARK: Time and Data formaters [LIST]
    func formatTime(_ date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        return timeFormatter.string(from: date)
    }
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
}

