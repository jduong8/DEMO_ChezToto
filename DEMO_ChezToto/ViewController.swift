//
//  ViewController.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Création et configuration de l'UIImageView
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = UIImage(named: "pizzeria") // Remplacez avec le nom de votre image
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 354),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 68),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19)
        ])
        
        // Création de votre RoundedRectangleView
        let roundedRectangle = RoundedRectangleView(frame: CGRect(x: 138, y: 107, width: 117, height: 68)) // Ajustez la taille et la position
        view.addSubview(roundedRectangle)
    }
}

