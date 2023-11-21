//
//  Dish.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import Foundation

struct Dish {
    let name: String
    let description: String
    let pictureName: String
    let price: Double
}

// MARK: - Mock

extension Dish {
    static var mockDish: Dish {
        Dish(
            name: "",
            description: "",
            pictureName: "",
            price: 0.0
        )
    }
    
    static var mockDishs: [Dish] {
        [
            Dish(
                name: "Toto",
                description: "test",
                pictureName: "peperoni",
                price: 10.0
            ),
            Dish(
                name: "Tata",
                description: "another test",
                pictureName: "vege",
                price: 12.0
            )
        ]
    }
}
