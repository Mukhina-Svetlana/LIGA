//
//  CustomView.swift
//  HomeTask5
//
//  Created by Светлана Мухина on 05.03.2022.
//

import UIKit

enum TypeScreenToValidation {
    case name
    case email
}

class GeneralValidationView: UIView {
    
    private var typeScreenToValidation: TypeScreenToValidation
    
    private lazy var firstCardView: UIView = {
        let view  = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = .systemYellow
        return view
    }()
    
    private lazy var textFieldToValidation: UITextField = {
        let tf = UITextField()
        if typeScreenToValidation == .email {
            tf.placeholder = "Введите почту"
        } else{ tf.placeholder = "Введите имя и фамилию" }
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
    
    private lazy var didValidationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Валидировать  ", for: .normal)
        button.backgroundColor = .systemGreen
        button.tintColor = .black
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapValidationButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var validationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидации..."
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 21)
        return label
    }()
    
    init(typeScreenToValidation: TypeScreenToValidation) {
        self.typeScreenToValidation = typeScreenToValidation
        super.init(frame: .zero)
        configuration(view: self)
        tapScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tapScreen() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(sender:)))
        tapScreen.cancelsTouchesInView = false
        self.addGestureRecognizer(tapScreen)
    }
    
}

extension GeneralValidationView {
    func configuration(view: UIView) {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(firstCardView)
        firstCardView.addSubview(textFieldToValidation)
        firstCardView.addSubview(didValidationButton)
        firstCardView.addSubview(validationResultLabel)
        
        
        NSLayoutConstraint.activate([
            
            firstCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            firstCardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            firstCardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            textFieldToValidation.topAnchor.constraint(equalTo: firstCardView.topAnchor, constant: 20),
            textFieldToValidation.leadingAnchor.constraint(equalTo: firstCardView.leadingAnchor, constant: 30),
            textFieldToValidation.trailingAnchor.constraint(equalTo: firstCardView.trailingAnchor, constant: -30),
            textFieldToValidation.heightAnchor.constraint(equalToConstant: 40),
            
            didValidationButton.topAnchor.constraint(equalTo: textFieldToValidation.bottomAnchor, constant: 20),
            didValidationButton.centerXAnchor.constraint(equalTo: firstCardView.centerXAnchor),
            
            
            validationResultLabel.topAnchor.constraint(equalTo: didValidationButton.bottomAnchor, constant: 20),
            validationResultLabel.leadingAnchor.constraint(equalTo: firstCardView.leadingAnchor, constant: 20),
            validationResultLabel.trailingAnchor.constraint(equalTo: firstCardView.trailingAnchor, constant: -20),
            validationResultLabel.bottomAnchor.constraint(equalTo: firstCardView.bottomAnchor, constant: -40)
        ])
    }
    
    @objc
    private func didTapValidationButton() {
        var regExString = ""
        let label = validationResultLabel
        let tf = textFieldToValidation
        switch typeScreenToValidation{
        case .name:
            regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        default:
            regExString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}+[a-z]{2,64}"
        }
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: tf.text)
        
        label.text = isValid ? "Валидация прошла успешно 👍🏻 " : "В поле ошибка! "
        label.textColor = isValid ? .systemTeal : .systemRed
    }
    
    @objc
    private func dismissKeyboard(sender: UITapGestureRecognizer) {
        self.endEditing(true)
    }
}
