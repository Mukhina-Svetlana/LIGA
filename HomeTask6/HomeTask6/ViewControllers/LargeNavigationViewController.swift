//
//  LargeNavigationViewController.swift
//  HomeTask6
//
//  Created by Светлана Мухина on 08.03.2022.
//

import UIKit

class LargeNavigationViewController: UIViewController {
    
    lazy private var newVCPress: UIButton = {
       let button = UIButton(type: .system)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.setTitle("  Push me ", for: .normal)
       button.titleLabel!.font = UIFont.systemFont(ofSize: 20)
       button.backgroundColor = .orange
       button.tintColor = .systemBlue
       button.layer.cornerRadius = 4
       button.addTarget(self, action: #selector(toNotLarge), for: .touchUpInside)
       return button
   }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        self.title = "Large Navigation"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
       configuration()
    }
}

extension LargeNavigationViewController {
   @objc
   private func toNotLarge(){
       let newViewController = AfterLargeViewController()
       navigationController?.pushViewController(newViewController, animated: true)
   }
    
    private func configuration(){
    view.addSubview(newVCPress)
    NSLayoutConstraint.activate([
        newVCPress.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        newVCPress.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    }
}
