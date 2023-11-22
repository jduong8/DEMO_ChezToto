//
//  ContactInfoView.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import UIKit

class ContactInfoView: UIView {
    private var button: UIButton!
    private var image: UIImageView!
    private var name: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        
        image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(image)
        
        name = UILabel()
        name.textColor = UIColor(named: "ctGray")
        name.font = UIFont.systemFont(ofSize: 12)
        name.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(name)
        
        setupConstraints()
    }
    
    // Méthode pour configurer la vue
    func configure(withImage imageName: String, text: String, action: @escaping () -> Void) {
        image.image = UIImage(named: imageName)
        name.text = text

        button.addAction(UIAction { _ in action() }, for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            button.heightAnchor.constraint(equalToConstant: 15),

            image.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            image.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 12),
            image.heightAnchor.constraint(equalToConstant: 12),

            name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15),
            name.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            name.trailingAnchor.constraint(lessThanOrEqualTo: button.trailingAnchor, constant: -10)
        ])
    }
}
