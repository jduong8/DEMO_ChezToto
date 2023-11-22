//
//  RoundedRectangleView.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import UIKit

class RoundedRectangleView: UIView {

    private var label: UILabel!
    private var secondLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        // Configuration du rectangle arrondi
        layer.cornerRadius = 5
        layer.masksToBounds = true
        backgroundColor = .white

        // Ajout du label
        label = UILabel()
        label.text = "Chez Toto"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        addSubview(label)
        
        // Ajout du second label
        secondLabel = UILabel()
        secondLabel.text = "Pizzeria"
        secondLabel.textColor = UIColor(named: "ctGray")
        secondLabel.textAlignment = .center
        secondLabel.font = UIFont.systemFont(ofSize: 12)
        addSubview(secondLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // Ajuster la taille du premier label pour qu'il corresponde à la vue
        label.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height / 1.5) // Prend la moitié supérieure

        // Ajuster la taille et la position du second label pour qu'il soit en dessous du premier
        secondLabel.frame = CGRect(x: 0, y: bounds.height / 2.5, width: bounds.width, height: bounds.height / 2) // Prend la moitié inférieure
    }
}
