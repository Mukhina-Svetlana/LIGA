//
//  ViewController.swift
//  HeaderTableView
//
//  Created by Светлана Мухина on 15.03.2022.
//

import UIKit

class ViewController: UIViewController {
    var models: [Model] = [Model(expand: true,
                                 title: " Top-5 Moscow ",
                                 cellModel: [ModelOfCell(nameSinger: "Artik & Asti", nameSong:  "Гармония", nameImage: "Гармония"), ModelOfCell(nameSinger: "Егор Крид & MakSim", nameSong: "Отпускаю", nameImage: "Отпускаю"), ModelOfCell(nameSinger: "ANNA ASTI", nameSong: "Фенникс", nameImage: "Фенникс"), ModelOfCell(nameSinger: "Jakomo & A.V.G.", nameSong: "Платина", nameImage: "Платина"),ModelOfCell(nameSinger: "Andro", nameSong:  "Как не любить", nameImage: "Andro")]),
                           Model(expand: true,
                                 title: " Top-5 Алма-Ата ",
                                 cellModel: [ModelOfCell(nameSinger: "Andro", nameSong:  "Как не любить", nameImage: "Andro"), ModelOfCell(nameSinger: "Ulukmanapo", nameSong: "Летали", nameImage: "Летали"), ModelOfCell(nameSinger: "KOBA & MANS", nameSong: "Jaryq", nameImage: "Jaryq"), ModelOfCell(nameSinger: "С любовью", nameSong: "Captown", nameImage: "Captown")]),
                           Model(expand: true,
                                 title: " Top-5 Атланта ",
                                 cellModel: [ModelOfCell(nameSinger: "Lil Durk", nameSong:  "AHHH HA", nameImage: "Pettty Too"), ModelOfCell(nameSinger: "Lil Durk", nameSong: "Petty Too", nameImage: "Pettty Too"), ModelOfCell(nameSinger: " Kodak Black", nameSong: "Super Gremlin", nameImage: "Super Gremlin"), ModelOfCell(nameSinger: "Gunna", nameSong: "Banking On Me", nameImage: "Banking On Me"),ModelOfCell(nameSinger: "Gunna & Future", nameSong:  "Pushin P", nameImage: "pushin P")])
    ]
    
    private lazy var cellIdentity = "cell"
    private lazy var headerIdentity = String(describing: CustomHeader.self)
    
    private lazy var tableView: UITableView = {
        navigationController?.navigationBar.backgroundColor = .systemPink
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellIdentity)
        tableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: headerIdentity)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        title = "Топ-чарты по городам"
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !models[section].expand {
            return 0
        } else{return models[section].cellModel.count}
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentity, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        cell.textForEachCell(
            labelSong: models[indexPath.section].cellModel[indexPath.row].nameSong, labelSinger: models[indexPath.section].cellModel[indexPath.row].nameSinger, imageSong: models[indexPath.section].cellModel[indexPath.row].nameImage)
        //cell.textLabel?.text = "\(indexPath.row)"
        return cell
        
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentity) as! CustomHeader
        header.label.text = models[section].title
        header.buttonPresentation(expanded: models[section].expand, section: section)
        header.delegate = self
        return header
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 70
//    }
}

extension ViewController: HeaderButtonDelegate {
    func expandSection(button: UIButton) {
        let section = button.tag
        let expand = models[section].expand
        models[section].expand = !expand
        tableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
}

