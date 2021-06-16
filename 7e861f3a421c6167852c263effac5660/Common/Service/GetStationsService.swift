//
//  GetStationsService.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 14.06.2021.
//

import Foundation

extension String: Error { }

typealias GetStationsCompletionHandler = (Result<[StationInfo], String>) -> Void

final class GetStationsService {
    
    private static let url = URL(string: "https://run.mocky.io/v3/e7211664-cbb6-4357-9c9d-f12bf8bab2e2")!
    
    static func fetchStations(handler: @escaping GetStationsCompletionHandler) {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    handler(.failure(error.localizedDescription))
                    return
                }
                
                if let data = data,
                   let response = response as? HTTPURLResponse,
                   response.statusCode == 200 {
                    
                    do {
                        let stations = try JSONDecoder().decode([StationInfo].self, from: data)
                        handler(.success(stations))
                    } catch let error {
                        #if DEBUG
                        debugPrint(error.localizedDescription)
                        #endif
                        handler(.failure("Beklenmedik bir hata meydana geldi."))
                    }
                } else {
                    handler(.failure("Beklenmedik bir hata meydana geldi."))
                }
            }
        }
        
        task.resume()
    }
}

final class StationInfo: Codable {
    let name: String
    let coordinateX: Int
    let coordinateY: Int
    let capacity: Int
    var stock: Int
    var need: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case coordinateX = "coordinateX"
        case coordinateY = "coordinateY"
        case capacity = "capacity"
        case stock = "stock"
        case need = "need"
    }
}
