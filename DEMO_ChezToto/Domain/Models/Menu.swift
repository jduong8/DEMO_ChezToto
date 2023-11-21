//
//  Menu.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import Foundation

struct Menu {
    let name: String
    let dishs: [Dish]
}

// MARK: - Mock

extension Menu {
    static var mockMenu: Menu {
        Menu(
            name: "Test",
            dishs: Dish.mockDishs
        )
    }
    
    static var mockMenus: [Menu] {
        [
            Menu(
                name: "Tata",
                dishs: Dish.mockDishs
            ),
            Menu(
                name: "Toto",
                dishs: Dish.mockDishs
            )
        ]
    }
}
