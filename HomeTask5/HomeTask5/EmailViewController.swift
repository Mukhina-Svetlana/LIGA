//
//  EmailViewController.swift
//  HomeTask5
//
//  Created by Светлана Мухина on 04.03.2022.
//

import UIKit

class EmailViewController: UIViewController {
    
    override func loadView() {
        view = CustomView(typeScreenToValidation: .email)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
