//
//  ViewController.swift
//  HomeTask3.2
//
//  Created by Светлана Мухина on 24.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var hiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Добро пожаловать!"
        label.textAlignment = .center
        label.textColor = .purple
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    //MARK: First Card
    private lazy var firstCardVew: UIView = {
        let view  = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    private lazy var namedTF: UITextField = {
       let tf = UITextField()
        tf.placeholder = "Введите имя и фамилию"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .bezel
        tf.font = .systemFont(ofSize: 18)
        tf.textColor = .black
        tf.clearButtonMode = .whileEditing
        tf.autocorrectionType = .no
        tf.keyboardType = .namePhonePad
        return tf
    }()
    
    private lazy var nameValidationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Валидировать  ", for: .normal)
        //button.setTitle("не дави на меня", for: .highlighted)
        button.backgroundColor = .systemTeal
        button.tintColor = .black
       // button.setTitleColor(.lightGray, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapValidateButton), for: .touchUpInside)
        return button
    }()
    private lazy var nameValidationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидации..."
        //label.textAlignment = .center
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 16)
        return label
    }()
    
    //MARK: Second Card
    private lazy var secondCardVew: UIView = {
        let view  = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    private lazy var emailTF: UITextField = {
       let tf = UITextField()
        tf.placeholder = "Введите почту"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .bezel
        tf.font = .systemFont(ofSize: 18)
        tf.textColor = .black
        tf.clearButtonMode = .whileEditing
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    
    private lazy var emailValidationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Валидировать  ", for: .normal)
        button.backgroundColor = .systemYellow
        button.tintColor = .black
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapEmailValidateButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailValidationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидации..."
        //label.textAlignment = .center
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 16)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }

}

extension ViewController {
    private func configuration() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(hiLabel)
        
        view.addSubview(firstCardVew)
        firstCardVew.addSubview(namedTF)
        firstCardVew.addSubview(nameValidationButton)
        firstCardVew.addSubview(nameValidationResultLabel)
        
        view.addSubview(secondCardVew)
        secondCardVew.addSubview(emailTF)
        secondCardVew.addSubview(emailValidationButton)
        secondCardVew.addSubview(emailValidationResultLabel)
        
        NSLayoutConstraint.activate([
            
            hiLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            hiLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            hiLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            firstCardVew.topAnchor.constraint(equalTo: hiLabel.bottomAnchor,constant: 15),
            firstCardVew.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstCardVew.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            firstCardVew.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4),
        
            namedTF.topAnchor.constraint(equalTo: firstCardVew.topAnchor, constant: 20),
            namedTF.leadingAnchor.constraint(equalTo: firstCardVew.leadingAnchor, constant: 10),
            namedTF.trailingAnchor.constraint(equalTo: firstCardVew.trailingAnchor, constant: -10),
            namedTF.heightAnchor.constraint(equalToConstant: 40),
            
            nameValidationButton.topAnchor.constraint(equalTo: namedTF.bottomAnchor, constant: 20),
            nameValidationButton.centerXAnchor.constraint(equalTo: firstCardVew.centerXAnchor),
            nameValidationButton.heightAnchor.constraint(equalToConstant: 40),
            
            nameValidationResultLabel.topAnchor.constraint(equalTo: nameValidationButton.bottomAnchor, constant: 15),
            nameValidationResultLabel.leadingAnchor.constraint(equalTo: firstCardVew.leadingAnchor, constant: 20),
            nameValidationResultLabel.trailingAnchor.constraint(equalTo: firstCardVew.trailingAnchor, constant: -20),
            
            secondCardVew.topAnchor.constraint(equalTo: firstCardVew.bottomAnchor, constant: 30),
            secondCardVew.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondCardVew.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            secondCardVew.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4),
            
            emailTF.topAnchor.constraint(equalTo: secondCardVew.topAnchor, constant: 20),
            emailTF.leadingAnchor.constraint(equalTo: secondCardVew.leadingAnchor, constant: 10),
            emailTF.trailingAnchor.constraint(equalTo: secondCardVew.trailingAnchor, constant: -10),
            emailTF.heightAnchor.constraint(equalToConstant: 40),
            
            emailValidationButton.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 20),
            emailValidationButton.centerXAnchor.constraint(equalTo: secondCardVew.centerXAnchor),
            emailValidationButton.heightAnchor.constraint(equalToConstant: 40),
            
            emailValidationResultLabel.topAnchor.constraint(equalTo: emailValidationButton.bottomAnchor, constant: 15),
            emailValidationResultLabel.leadingAnchor.constraint(equalTo: secondCardVew.leadingAnchor, constant: 20),
            emailValidationResultLabel.trailingAnchor.constraint(equalTo: secondCardVew.trailingAnchor, constant: -20),
            
        ])
        
    }
    
    @objc
    private func didTapValidateButton() {
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: namedTF.text)

        nameValidationResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        nameValidationResultLabel.textColor = isValid ? .systemGreen : .systemRed
    }
    
    @objc
    private func didTapEmailValidateButton() {
        let regExString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: emailTF.text)

        emailValidationResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        emailValidationResultLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}


