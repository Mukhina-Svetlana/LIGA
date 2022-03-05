//
//  NameViewController.swift
//  HomeTask5
//
//  Created by Светлана Мухина on 04.03.2022.
//

import UIKit

class NameViewController: UIViewController {
    
    override func loadView() {
        view = GeneralValidationView(typeScreenToValidation: .name)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
