//
//  WelcomeViewController.swift
//  loginApp
//
//  Created by Анна on 11.02.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    var user = ""
    
    let gradientWelcomeView = CAGradientLayer()
    let gradientButtonLogOut = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user)!"
        view.layer.insertSublayer(gradientWelcomeView , at: 0)
        customizingTheAppearanceOfTheButton()
    }
}

extension WelcomeViewController {
    func customizingTheAppearanceOfTheButton() {
        logOutButton.layer.cornerRadius = 5
        logOutButton.tintColor = .white
        gradientButtonLogOut.frame = logOutButton.bounds
        gradientButtonLogOut.colors = [UIColor.red.cgColor, UIColor.systemOrange.cgColor, UIColor.systemYellow.cgColor]
        gradientButtonLogOut.cornerRadius = 5
        gradientButtonLogOut.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientButtonLogOut.endPoint = CGPoint(x: 1.3, y: 1.3)
        logOutButton.layer.insertSublayer(gradientButtonLogOut, at: 0)
    }
}
