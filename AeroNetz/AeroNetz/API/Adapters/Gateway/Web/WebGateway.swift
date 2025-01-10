//
//  WebGateway.swift
//  WaiAirlines
//
//  Created by Victor Levenetz Mariano on 05/10/24.
//

import Foundation

class WebGateway{
    //MARK: API CLASS
    var flightConverter = FlightConverter()
    
    func fetchFlights(completion: @escaping (Result<[FlightModel], Error>) -> Void) {
        //get the file name
        let fileName: String = "massa-de-teste"
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            completion(.failure(NSError(domain: "ApiServiceError", code: 404, userInfo: [NSLocalizedDescriptionKey: "File not found"])))
            return
        }
        //MARK: Json decoder and converter to Model
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let result = try decoder.decode(FlightsResponse.self, from: data)
            let flights = flightConverter.convertToModel(res: result.flights)
            
            completion(.success(flights))
        } catch {
            completion(.failure(error))
        }
    }
    
}
