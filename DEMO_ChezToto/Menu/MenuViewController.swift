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
        self.view.backgroundColor = .systemBackground

        // Création de la stack horizontale
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .center
        horizontalStackView.distribution = .fill
        horizontalStackView.spacing = 25

        // Création de l'image
        let imageView = UIImageView()
        imageView.image = .garlicBread
        imageView.frame = CGRect(x: 0, y: 0, width: 116.05, height: 86)
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true

        // Ajout de l'image à la stack horizontale
        horizontalStackView.addArrangedSubview(imageView)

        // Création de la stack verticale pour les textes
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .leading
        verticalStackView.distribution = .fill
        verticalStackView.spacing = 10

        // Ajout des labels à la stack verticale
        let text1 = UILabel()
        text1.text = "Garlic bread"
        text1.textColor = .ctGray
        text1.font = UIFont.boldSystemFont(ofSize: 14)
        verticalStackView.addArrangedSubview(text1)

        let text2 = UILabel()
        text2.text = "Du pain legèrement \ncroustillant parfumé à l’ail"
        text2.textColor = .ctGray
        text2.numberOfLines = 2
        text2.font = UIFont.systemFont(ofSize: 12)
        verticalStackView.addArrangedSubview(text2)

        let text3 = UILabel()
        text3.text = "3,50€"
        text3.textColor = .ctGray
        text3.font = UIFont.boldSystemFont(ofSize: 12)
        verticalStackView.addArrangedSubview(text3)

        // Ajout de la stack verticale à la stack horizontale
        horizontalStackView.addArrangedSubview(verticalStackView)

        // Configuration de la stack horizontale
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontalStackView)

        // Contraintes pour la stack horizontale
        NSLayoutConstraint.activate([
            horizontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            text1.heightAnchor.constraint(equalToConstant: 15),
            text2.heightAnchor.constraint(equalToConstant: 33),
            text3.heightAnchor.constraint(equalToConstant: 15),
        ])
    }
}
