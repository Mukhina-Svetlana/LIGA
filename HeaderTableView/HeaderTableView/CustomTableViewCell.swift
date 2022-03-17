//
//  CustomTableViewCell.swift
//  HeaderTableView
//
//  Created by Светлана Мухина on 16.03.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var index = 1
    var arrayStars = [UIImageView]()
    lazy private var labelSong: UILabel = {
       let label = UILabel()
        label.layer.cornerRadius = 10
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "ArialRoundedMTBold", size: 14)
       // label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy private var imageSong: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    lazy private var stackStars: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 3
      //  stack.tag = 5007
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    lazy private var imageStars: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "star")
        image.backgroundColor = .white
        return image
    }()
    
    lazy private var buttonAdd: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.setTitle("  +   ", for: .normal)
        button.setTitleColor(.systemBrown, for: .normal)
        button.addTarget(self, action: #selector(increaseStar), for: .touchUpInside)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textForEachCell(labelSong: String, labelSinger: String, imageSong: String){
        self.labelSong.text = labelSong + "           " + labelSinger
        self.imageSong.image = UIImage(named: "\(imageSong)")
    }
    
}

extension CustomTableViewCell{

    private func configuration(){
        for i in 0..<5 {
            let imageView = UIImageView()
            if i == 0 {
                imageView.image = UIImage(systemName: "star.fill")
                imageView.tintColor = .systemPink
               // imageView.tag = 5009
            } else {
            imageView.image = UIImage(systemName: "star")
                imageView.tintColor = .black }
            stackStars.addArrangedSubview(imageView)
            arrayStars.append(imageView)
        }
        contentView.addSubview(stackStars)
        contentView.addSubview(labelSong)
        contentView.addSubview(imageSong)
        contentView.addSubview(buttonAdd)
        
        NSLayoutConstraint.activate([
            imageSong.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageSong.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageSong.heightAnchor.constraint(equalToConstant: 70),
            imageSong.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imageSong.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/5),
            labelSong.topAnchor.constraint(equalTo: imageSong.topAnchor, constant: 20),
            labelSong.leadingAnchor.constraint(lessThanOrEqualTo: imageSong.trailingAnchor, constant: 40),
            stackStars.topAnchor.constraint(equalTo: labelSong.bottomAnchor, constant: 10),
            stackStars.leadingAnchor.constraint(equalTo: imageSong.trailingAnchor, constant: 30),
            stackStars.bottomAnchor.constraint(equalTo: imageSong.bottomAnchor, constant: -10),
            buttonAdd.topAnchor.constraint(equalTo: stackStars.topAnchor),
            buttonAdd.leadingAnchor.constraint(greaterThanOrEqualTo: stackStars.trailingAnchor,constant: 30),
            buttonAdd.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            buttonAdd.bottomAnchor.constraint(equalTo: stackStars.bottomAnchor),
            buttonAdd.widthAnchor.constraint(equalToConstant: 60),
        ])
        
    }
    @objc
    private func increaseStar(){
        if index <= 4 {
        arrayStars[index].image = UIImage(systemName: "star.fill")
        arrayStars[index].tintColor = .systemPink
            index += 1
        } else{
            index -= 5
            arrayStars.forEach{
                $0.image = UIImage(systemName: "star")
                $0.tintColor = .black
            }
        }
    }
    
}
