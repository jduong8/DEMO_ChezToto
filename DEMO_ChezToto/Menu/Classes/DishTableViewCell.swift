//
//  DishTableViewCell.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 23/11/2023.
//

import UIKit

class DishTableViewCell: UITableViewCell {
    
    let pictureImageView = UIImageView()
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        // Configuration des éléments de l'interface
        pictureImageView.contentMode = .scaleAspectFit
        pictureImageView.layer.cornerRadius = 10
        pictureImageView.clipsToBounds = true

        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        nameLabel.textColor = .ctGray
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textColor = .ctGray
        descriptionLabel.numberOfLines = 2
        descriptionLabel.lineBreakMode = .byTruncatingTail
        priceLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        priceLabel.textColor = .ctGray

        // Ajout des vues à la vue de contenu de la cellule
        contentView.addSubview(pictureImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
    }

    private func setupConstraints() {
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false

        // Ajout de contraintes pour positionner et dimensionner les vues
        NSLayoutConstraint.activate([
            pictureImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            pictureImageView.widthAnchor.constraint(equalToConstant: 116),
            pictureImageView.heightAnchor.constraint(equalToConstant: 86),
            pictureImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            nameLabel.heightAnchor.constraint(equalToConstant: 18),
            nameLabel.leadingAnchor.constraint(equalTo: pictureImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),

            descriptionLabel.heightAnchor.constraint(equalToConstant: 33),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),

            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10)
        ])
    }

    func configure(with dish: Dish) {
        // Configuration de la cellule avec les données du plat
        pictureImageView.image = UIImage(named: dish.pictureName)
        nameLabel.text = dish.name
        descriptionLabel.text = dish.description
        priceLabel.text = String(format: "%g €", dish.price)
    }
}
