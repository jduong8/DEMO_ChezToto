//
//  TimeInfoView.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import UIKit

class TimeInfoView: UIView {

    private var iconImageView: UIImageView!
    private var dayLabel: UILabel!
    private var timeLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "timeIcon")
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconImageView)

        dayLabel = UILabel()
        dayLabel.textColor = UIColor(named: "ctGray")
        dayLabel.font = UIFont.boldSystemFont(ofSize: 12)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dayLabel)

        timeLabel = UILabel()
        timeLabel.textColor = UIColor(named: "ctGray")
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.textAlignment = .right
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timeLabel)
        
        setupConstraints()
    }
    
    func configure(day: String, time: String) {
        dayLabel.text = day
        timeLabel.text = time
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Contraintes pour iconImageView
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 15), // Ajustez selon la taille de l'icône
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),

            // Contraintes pour dayLabel
            dayLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            dayLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            // Contraintes pour timeLabel
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
