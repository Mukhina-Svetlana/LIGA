//
//  ViewController.swift
//  HomeTask5
//
//  Created by Светлана Мухина on 04.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy private var nameButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitle("  Валидация имени  ", for: .normal)
        button.backgroundColor = .magenta
        button.tintColor = .black
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapNameValidation), for: .touchUpInside)
        return button
    }()
    
    lazy private var emailButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitle("  Валидация почты  ", for: .normal)
        button.backgroundColor = .magenta
        button.tintColor = .black
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapEmailValidation), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}
extension ViewController {
    
    private func configuration() {
        title = "Тип валидации"
        view.backgroundColor = .systemBackground
        view.addSubview(nameButton)
        view.addSubview(emailButton)
        
        NSLayoutConstraint.activate([
            nameButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameButton.heightAnchor.constraint(equalToConstant: 60),
            nameButton.trailingAnchor.constraint(equalTo: emailButton.leadingAnchor, constant: -20),
            emailButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            emailButton.topAnchor.constraint(equalTo: nameButton.topAnchor),
            emailButton.heightAnchor.constraint(equalTo: nameButton.heightAnchor),
            emailButton.widthAnchor.constraint(equalTo: nameButton.widthAnchor)
        ])
    }
    
    @objc
    private func didTapNameValidation(){
       let nameViewController = NameViewController()
        nameViewController.modalPresentationStyle = .pageSheet
        present(nameViewController, animated: true, completion: nil)
    }
    
    @objc
    private func didTapEmailValidation(){
        let emailViewController = EmailViewController()
        navigationController?.pushViewController(emailViewController, animated: true)
    }
}
