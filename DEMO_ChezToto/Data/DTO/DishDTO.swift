//
//  DishDTO.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import Foundation

struct DishDTO: Decodable {
    let name: String?
    let description: String?
    let pictureName: String?
    let price: Double?
}
