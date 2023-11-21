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
        let roundedRectangle = RoundedRectangleView(frame: CGRect(x: 138, y: 107, width: 117, height: 68))
        view.addSubview(roundedRectangle)
        
        let schedule: [(day: String, hours: String)] = [
            ("Lundi", "Fermé"),
            ("Mardi", "11h30 - 14h30 ・ 18h30 - 22h00"),
            ("Mercredi", "11h30 - 14h30 ・ 18h30 - 22h00"),
            ("Jeudi", "11h30 - 14h30 ・ 18h30 - 22h00"),
            ("Vendredi", "11h30 - 14h30 ・ 18h30 - 22h00"),
            ("Samedi", "11h30 - 14h30 ・ 18h30 - 22h00"),
            ("Dimanche", "Fermé")
        ]
        var previousDayView: UIView? = nil

        for (day, hours) in schedule {
            let timeInfoView = TimeInfoView()
            timeInfoView.translatesAutoresizingMaskIntoConstraints = false
            timeInfoView.configure(day: day, time: hours)
            view.addSubview(timeInfoView)

            NSLayoutConstraint.activate([
                timeInfoView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
                timeInfoView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
                timeInfoView.heightAnchor.constraint(equalToConstant: 15)
            ])

            if let previousDayView = previousDayView {
                timeInfoView.topAnchor.constraint(equalTo: previousDayView.bottomAnchor, constant: 10).isActive = true
            } else {
                timeInfoView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
            }

            previousDayView = timeInfoView
        }
    }
}
