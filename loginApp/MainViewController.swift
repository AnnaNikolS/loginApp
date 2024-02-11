//
//  ViewController.swift
//  loginApp
//
//  Created by Анна on 11.02.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    let userName = "Ann"
    let password = "11"
    
    let gradientMainView = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        gradientMainView.frame = view.bounds
        gradientMainView.colors = [UIColor.systemIndigo.cgColor, UIColor.systemCyan.cgColor]
        gradientMainView.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradientMainView, at: 0)
        
        userNameTextField.backgroundColor = .white
        userNameTextField.attributedPlaceholder = NSAttributedString(string: "User Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        passwordTextField.backgroundColor = .white
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        logInButton.layer.cornerRadius = 5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeViewController = segue.destination as? WelcomeViewController
        welcomeViewController?.user = userName
        
        welcomeViewController?.gradientWelcomeView.frame = view.bounds
        welcomeViewController?.gradientWelcomeView.colors = [UIColor.red.cgColor, UIColor.systemOrange.cgColor]
        welcomeViewController?.gradientWelcomeView.locations = [0.0, 1.0]
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (userNameTextField.text == userName) && (passwordTextField.text == password) {
            return true
        } else {
            showAlert(withTitle: "Invalid login or password", andMessage: "Please, enter correct login and password")
        }
        return false
    }
    
    @IBAction func pressedFUNButton() {
        showAlert(withTitle: "Oops!", andMessage: "Your name is Ann 😉")
    }
    
    @IBAction func pressedFPButton() {
        showAlert(withTitle: "Oops!", andMessage: "Your password is 11 😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


