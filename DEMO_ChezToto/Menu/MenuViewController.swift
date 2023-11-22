//
//  MenuViewController.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 22/11/2023.
//

import UIKit

class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Création d'un UILabel
        let helloWorldLabel = UILabel()
        helloWorldLabel.text = "Hello World" // Définition du texte
        helloWorldLabel.textAlignment = .center // Alignement du texte au centre
        helloWorldLabel.frame = CGRect(x: 100, y: 100, width: 200, height: 50) // Position et taille du label

        // Ajout du UILabel à la vue du contrôleur
        view.addSubview(helloWorldLabel)
    }
}
