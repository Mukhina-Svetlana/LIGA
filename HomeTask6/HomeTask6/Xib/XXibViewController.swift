//
//  XXibViewController.swift
//  HomeTask6
//
//  Created by Светлана Мухина on 14.03.2022.
//

import UIKit

class XXibViewController: UIViewController {

    @IBOutlet var addButton: [UIButton]!
    @IBOutlet var cards: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in cards{
            i.layer.cornerRadius = 10
        }
        for i in addButton{
            i.layer.cornerRadius = 7
        }
        view.backgroundColor = .secondarySystemBackground
        title = "XIB"
        let button1 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newVC))
        navigationItem.rightBarButtonItem  = button1
    }
    @objc
    private func newVC(){
        let newViewController = ModallyNewViewController(typeViewController: .xib)
         newViewController.modalPresentationStyle = .fullScreen
         present(newViewController, animated: true, completion: nil)
       // navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @IBAction func add2(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
    
    @IBAction func modeToModally(_ sender: UIButton) {
        let newViewController = ModallyViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
