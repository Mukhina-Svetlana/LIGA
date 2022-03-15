//
//  ManualViewController.swift
//  HomeTask6
//
//  Created by Светлана Мухина on 08.03.2022.
//

import UIKit

class ManualViewController: UIViewController {
    
    lazy private var cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var labelCource: UILabel = {
        var label = UILabel()
        label.text = "Курсы по iOS разработке + Сomputer Science + Computer Vision + System Design "
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
        button.addTarget(self, action: #selector(toModallyVC), for: .touchUpInside)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    lazy private var priceLabel: UILabel = {
        var label = UILabel()
        
        label.text = " 11 760 р"
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        self.title = "Manual"
        let button1 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newVC))
        self.navigationItem.rightBarButtonItem  = button1
    }
    
    @objc
    private func toModallyVC(){
        let newViewController = ModallyViewController()
        navigationController?.pushViewController(newViewController, animated: true)
//        show(UINavigationController(rootViewController: newViewController), sender: nil)
    }
    
    @objc
    private func toNavigationVC(){
        self.tabBarController?.selectedIndex = 3
    }
    
    @objc private func newVC(){
        let newViewController = ModallyNewViewController(typeViewController: .manual)
        newViewController.modalPresentationStyle = .pageSheet
        present(newViewController, animated: true, completion: nil)
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configuration()
    }
}

extension ManualViewController{
    private func configuration(){
        view.addSubview(cardView)
        cardView.addSubview(labelCource)
        cardView.addSubview(buttonMore)
        cardView.addSubview(priceLabel)
        cardView.addSubview(addButton)
        
        let viewWidth = UIScreen.main.bounds.width - 40
        cardView.frame = CGRect(x: 20, y: view.safeAreaInsets.top+20, width: viewWidth, height: 200)
        labelCource.frame = CGRect(x: 20, y: 0, width: viewWidth, height: 90)
        buttonMore.frame = CGRect(x: 20, y: labelCource.frame.maxY, width: viewWidth, height: 20)
        priceLabel.frame = CGRect(x: 20, y: buttonMore.frame.maxY+20, width: viewWidth, height: 30)
        addButton.frame = CGRect(x: viewWidth-120, y: priceLabel.frame.minY, width: 90, height: 40)
        // let sizeLabelCurse = labelCource.sizeThatFits(CGSize(width: viewWidth, height: 10))
        //  let sizeButtonMore = buttonMore.sizeThatFits(CGSize(width: viewWidth, height: 40))
        }
    }

