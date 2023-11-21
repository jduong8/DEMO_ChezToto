//
//  MenuDTO.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import Foundation

struct MenuDTO: Decodable {
    let name: String?
    let dishs: [DishDTO]?
}
