//
//  Dish+Mappers.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import Foundation

extension Dish {
    init(with dto: DishDTO) {
        self.name = dto.name ?? ""
        self.description = dto.description ?? ""
        self.pictureName = dto.pictureName ?? ""
        self.price = dto.price ?? 0.0
    }
}
