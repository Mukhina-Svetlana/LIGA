//
//  Model.swift
//  HeaderTableView
//
//  Created by Светлана Мухина on 16.03.2022.
//

import Foundation

struct Model {
    var expand: Bool
    let title: String
    var cellModel: [ModelOfCell]
}
struct ModelOfCell {
    var nameSinger: String
    var nameSong: String
    var nameImage: String
}
