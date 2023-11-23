//
//  ViewModel.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 23/11/2023.
//

import Foundation

class ViewModel {
    var menus: [Menu] = []
    
    private let service: MenuService
    
    init(service: MenuService = .init()) {
        self.service = service
        getMenu()
    }
    
    private func getMenu() {
        self.menus = service.getMenu()
    }
}
