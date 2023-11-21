//
//  API.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import Foundation

final class API {
    private let dataParser = DataParser()
    
    func getData() -> [MenuDTO] {
        dataParser.parse("totoDatas.json")
    }
}
