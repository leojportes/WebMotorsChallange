//
//  VehicleModel.swift
//  ChallengeWebmotors
//
//  Created by Leonardo Portes on 18/12/21.
//

import Foundation

struct Vehicles: Codable {
    
    let vehicles: [VehicleModel]
    
    enum CodingKeys: String, CodingKey {
        case vehicles
    }
}

struct VehicleModel: Codable {
    
    let color: String
    let id: Int
    let image: String
    let km: Int
    let make: String
    let model: String
    let price: String
    let version: String
    let yearFab: Int
    let yearModel: Int
    
    enum CodingKeys: String, CodingKey {
        case color = "Color"
        case id = "ID"
        case image = "Image"
        case km = "KM"
        case make = "Make"
        case model = "Model"
        case price = "Price"
        case version = "Version"
        case yearFab = "YearFab"
        case yearModel = "YearModel"
    }
}
