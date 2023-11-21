//
//  MenuPresenter.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import Foundation

class MenuPresenter {
    let menuService = MenuService()
    let viewPresenter: ViewPresenter
    
    init(viewPresenter: ViewPresenter) {
        self.viewPresenter = viewPresenter
    }
    
    func getData() {
        
    }
}
