//
//  ViewController.swift
//  DEMO_ChezToto
//
//  Created by Jonathan Duong on 21/11/2023.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    private var previousDayView: UIView? = nil
    private let contactPhone = ContactInfoView()
    private let mapView = MKMapView()
    private let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBannerView()
        setupSchedulesView()
        setupContactInfosView()
        setupMapView()
        setupMenuButtonView()
    }

}

// MARK: - Views

extension ViewController {
    private func setupBannerView() {
        // Création et configuration de l'UIImageView
        imageView.image = UIImage(named: "pizzeria")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 354),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 68),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19)
        ])
        
        // Création de RoundedRectangleView
        let roundedRectangle = RoundedRectangleView(frame: CGRect(x: 138, y: 107, width: 117, height: 68))
        view.addSubview(roundedRectangle)
    }
    
    private func setupSchedulesView() {
        let schedule: [(day: String, hours: String)] = [
            ("Lundi", "Fermé"),
            ("Mardi", "11h30 - 14h30 ・ 18h30 - 22h00"),
            ("Mercredi", "11h30 - 14h30 ・ 18h30 - 22h00"),
            ("Jeudi", "11h30 - 14h30 ・ 18h30 - 22h00"),
            ("Vendredi", "11h30 - 14h30 ・ 18h30 - 22h00"),
            ("Samedi", "11h30 - 14h30 ・ 18h30 - 22h00"),
            ("Dimanche", "Fermé")
        ]

        for (day, hours) in schedule {
            let timeInfoView = TimeInfoView()
            timeInfoView.translatesAutoresizingMaskIntoConstraints = false
            timeInfoView.configure(day: day, time: hours)
            view.addSubview(timeInfoView)

            NSLayoutConstraint.activate([
                timeInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
                timeInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
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
    
    private func setupContactInfosView() {
        // Création et configuration de ContactInfoView
        let contactAddress = ContactInfoView()
        contactAddress.configure(withImage: "localisation", text: "12 Rue Tolbiac, 75013 Paris") {
            // Action pour le premier bouton
            self.openMaps(withAddress: "12,Rue Tolbiac,Paris")
        }
        contactAddress.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactAddress)
        
        let contactURL = ContactInfoView()
        contactURL.configure(withImage: "site", text: "www.cheztotopizza.fr") {
            self.openURL(withURL: "http://www.cheztotopizza.fr")
        }
        contactURL.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactURL)
        
        contactPhone.configure(withImage: "phone", text: "0612345678") {
            self.showCallAlert(phoneNumber: "0612345678")
        }
        contactPhone.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactPhone)
        

        // Configuration des contraintes pour ContactInfoView
        NSLayoutConstraint.activate([
            contactAddress.topAnchor.constraint(equalTo: previousDayView?.bottomAnchor ?? imageView.bottomAnchor, constant: 20),
            contactAddress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contactAddress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            contactURL.topAnchor.constraint(equalTo: contactAddress.bottomAnchor, constant: 2),
            contactURL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contactURL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            contactPhone.topAnchor.constraint(equalTo: contactURL.bottomAnchor, constant: 2),
            contactPhone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contactPhone.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupMapView() {
        // Création et configuration de MKMapView
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.layer.cornerRadius = 20
        mapView.overrideUserInterfaceStyle = .dark // Mode sombre
        view.addSubview(mapView)

        // Configuration des contraintes pour MKMapView
        NSLayoutConstraint.activate([
            mapView.widthAnchor.constraint(equalToConstant: 354),
            mapView.heightAnchor.constraint(equalToConstant: 159),
            mapView.topAnchor.constraint(equalTo: contactPhone.topAnchor, constant: 50),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19)
        ])

        // Configurer la carte pour pointer sur une adresse
        setMapLocation(mapView, address: "12 Rue Tolbiac, 75013 Paris")
    }
    
    private func setupMenuButtonView() {
        // Création et configuration du bouton
        let menuButton = UIButton()
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.backgroundColor = UIColor.ctOrange
        menuButton.layer.cornerRadius = 10
        menuButton.setTitle("Accéder au menu", for: .normal)
        menuButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        menuButton.setTitleColor(UIColor.white, for: .normal)
        menuButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(menuButton)

        // Configuration des contraintes pour le bouton
        NSLayoutConstraint.activate([
            menuButton.widthAnchor.constraint(equalToConstant: 335),
            menuButton.heightAnchor.constraint(equalToConstant: 40),
            menuButton.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 70),
            menuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// MARK: - Private methods

extension ViewController {
    @objc private func goToMenu() {
        let menuViewController = MenuViewController()
        guard let navigationController = self.navigationController else {
            print("No navigation controller")
            return
        }
        
        navigationController.pushViewController(menuViewController, animated: true)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        animateButton(sender)
        goToMenu()
    }

    private func animateButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                button.transform = CGAffineTransform.identity
            }
        }
    }

    private func setMapLocation(_ mapView: MKMapView, address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            guard let placemark = placemarks?.first, let location = placemark.location else {
                print("Adresse introuvable: \(error?.localizedDescription ?? "Erreur inconnue")")
                return
            }

            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(region, animated: true)

            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = address
            mapView.addAnnotation(annotation)
        }
    }

    private func openMaps(withAddress address: String) {
        if let url = URL(string: "http://maps.apple.com/?address=\(address)") {
            UIApplication.shared.open(url)
        }
    }
    
    private func openURL(withURL urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
    
    private func showCallAlert(phoneNumber: String) {
        let alert = UIAlertController(title: "Lancer un appel", message: "Voulez-vous appeler \(phoneNumber)?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Annuler", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Appeler", style: .default, handler: { _ in
            if let phoneCallURL = URL(string: "\(phoneNumber)") {
                UIApplication.shared.open(phoneCallURL)
            }
        }))
        present(alert, animated: true, completion: nil)
    }
}
