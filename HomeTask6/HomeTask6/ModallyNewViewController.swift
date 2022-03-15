//
//  ModallyNewViewController.swift
//  HomeTask6
//
//  Created by Светлана Мухина on 10.03.2022.
//

import UIKit

enum VC {
    case autoLayout, xib
    case manual
}
class ModallyNewViewController: UIViewController {
    private var typeVC: VC
    
    override func viewDidLoad() {
        self.isModalInPresentation = false
        super.viewDidLoad()
        switch typeVC {
        case .autoLayout:
            view.backgroundColor = .secondarySystemBackground
        case .xib:
            view.backgroundColor = .secondarySystemBackground
            let closeButton: UIButton = UIButton(type: .close)
            closeButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
            view.addSubview(closeButton)
            closeButton.frame = CGRect(x: 20, y: 40, width: 40, height: 30)
        case .manual:
            view.alpha = 0.6
            view.backgroundColor = .systemGray
            view.isOpaque = false
        }
    }
    @objc private func dismissVC(){
        dismiss(animated: false, completion: nil)
    }
    
    init(typeViewController: VC){
        self.typeVC = typeViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
