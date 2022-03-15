//
//  CardsView.swift
//  HomeTask6
//
//  Created by Светлана Мухина on 09.03.2022.
//

import UIKit

class CardsView: UIView {
    
    var goToNavigationVC: (() -> Void)?
    var goToModallyVC: (() -> Void)?
    lazy private var textInfo: UILabel = {
        var label = UILabel()
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.text = "   Первые три занятия бесплатно"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    lazy private var labelCource: UILabel = {
        var label = UILabel()
        label.text = " Backend разработка "
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = .zero
        return label
    }()
    
    lazy private var buttonMore: UIButton = {
        var button = UIButton()
        button.setTitle(" Подробнее ", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(.gray, for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(toModallyVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    lazy private var priceLabel: UILabel = {
        var label = UILabel()
        label.text = " 7 840 р"
        label.textColor = .black
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy private var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  +  ", for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 35)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(toNavigationVC), for: .touchUpInside)
        return button
    }()
   
    @objc
    private func toNavigationVC(){
        goToNavigationVC!()
    }
    @objc
    private func toModallyVC(){
        goToModallyVC!()
    }
    
    init(){
        super.init(frame: .zero)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardsView {
    private func configuration(){
        self.layer.cornerRadius = 12
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textInfo)
        self.addSubview(labelCource)
        self.addSubview(buttonMore)
        self.addSubview(priceLabel)
        self.addSubview(addButton)
        NSLayoutConstraint.activate([
            textInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            textInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            labelCource.topAnchor.constraint(equalTo: textInfo.bottomAnchor, constant: 10),
            labelCource.leadingAnchor.constraint(equalTo: textInfo.leadingAnchor),
            labelCource.trailingAnchor.constraint(equalTo: textInfo.trailingAnchor,constant: 40),
            
            buttonMore.topAnchor.constraint(equalTo: labelCource.bottomAnchor, constant: 10),
            buttonMore.leadingAnchor.constraint(equalTo: textInfo.leadingAnchor),
            buttonMore.trailingAnchor.constraint(equalTo: textInfo.trailingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: buttonMore.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: buttonMore.leadingAnchor),
            addButton.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            addButton.leadingAnchor.constraint(greaterThanOrEqualTo: priceLabel.trailingAnchor, constant: 40),
            addButton.widthAnchor.constraint(equalToConstant: 80),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
        ])
    }
}
