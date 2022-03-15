//
//  ViewController.swift
//  HomeTask6
//
//  Created by Светлана Мухина on 08.03.2022.
//

import UIKit

class AutoLayoutViewController: UIViewController {
    private lazy var cardView1 = CardsView()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Auto Layout"
        configuration()
        let button1 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newVC))
        navigationItem.rightBarButtonItem  = button1
    }
    
    @objc
    private func newVC(){
        let newViewController = ModallyNewViewController(typeViewController: .autoLayout)
         newViewController.modalPresentationStyle = .pageSheet
         present(newViewController, animated: true, completion: nil)
    }
}


extension AutoLayoutViewController {
    
    func configuration() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(cardView1)
        cardView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            cardView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cardView1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
        
        cardView1.goToNavigationVC = {
            self.tabBarController?.selectedIndex = 3
        }
        cardView1.goToModallyVC = {
            let newViewController = ModallyViewController()
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
}

