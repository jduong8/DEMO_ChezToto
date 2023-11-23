//
//  MenuService.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import Foundation

class MenuService {

    let api: API

    init(api: API = .init()) {
        self.api = api
    }

    func getMenu() -> [Menu] {
        return self.api.getData().map { Menu(with: $0) }
    }
}
