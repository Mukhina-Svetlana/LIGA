//
//  AfterLargeViewController.swift
//  HomeTask6
//
//  Created by Светлана Мухина on 15.03.2022.
//

import UIKit

class AfterLargeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        self.title = "Standard Navigation"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .never
    }
}
