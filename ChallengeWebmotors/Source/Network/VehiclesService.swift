//
//  VehiclesService.swift
//  ChallengeWebmotors
//
//  Created by Leonardo Portes on 18/12/21.
//

import Foundation

protocol VehiclesServiceProtocol {
    func fetchData(page: Int, completion: @escaping ([VehicleModel]) -> Void, errorNetwork: @escaping (NetworkError) -> Void)
}

final class VehiclesService: VehiclesServiceProtocol {
    
    func fetchData(page: Int, completion: @escaping ([VehicleModel]) -> Void, errorNetwork: @escaping (NetworkError) -> Void) {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 5, execute: {
            let baseUrl = "https://desafioonline.webmotors.com.br/api/OnlineChallenge/"
            if let url = URL(string: "\(baseUrl)Vehicles?Page=\(page)") {
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                        if let error = error {
                            print("error: \(error.localizedDescription)")
                            return
                        }
                        
                        if let data = data {
                            do {
                                let result = try JSONDecoder().decode([VehicleModel].self, from: data)
                                completion(result)
                                
                            } catch let error {
                                errorNetwork(.jsonInvalid)
                                print(error.localizedDescription)
                                
                            }
                        }
                    
                }
                task.resume()
            }
            
        })
        
    }
}
