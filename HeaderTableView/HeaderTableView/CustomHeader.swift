//
//  CustomHeader.swift
//  HeaderTableView
//
//  Created by Светлана Мухина on 16.03.2022.
//

import UIKit

protocol HeaderButtonDelegate: AnyObject {
    
    func expandSection(button: UIButton)
}

class CustomHeader: UITableViewHeaderFooterView {
    
    weak var delegate: HeaderButtonDelegate?
    
    lazy var button: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.addTarget(self, action:#selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    lazy var label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc
    private func tapButton() {
        delegate?.expandSection(button: button)
    }
    
    func buttonPresentation(expanded: Bool, section: Int) {
        button.tag = section
            if expanded {
                button.setTitle("  -  ", for: .normal)
            } else {
                button.setTitle("  +  ", for: .normal)
            }
        }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomHeader {
    private func configuration() {
        addSubview(button)
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            button.topAnchor.constraint(equalTo: label.topAnchor),
            button.widthAnchor.constraint(equalToConstant: 80),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
}
