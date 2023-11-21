//
//  Menu+Mappers.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import Foundation

extension Menu {
    init(with dto: MenuDTO) {
        self.name = dto.name ?? ""
        self.dishs = dto.dishs?.map { Dish(with: $0) } ?? []
    }
}
