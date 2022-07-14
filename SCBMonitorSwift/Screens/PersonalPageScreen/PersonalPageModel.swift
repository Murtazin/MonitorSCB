//
//  PersonalPageModel.swift
//  SCBMonitorSwift
//
//  Created by Тимофей Борисов on 13.07.2022.
//

import Foundation

struct PDModel {
    let id: Int
    let type: Types
    let body: String
}

enum Types: Int {
    case one = 1, two, three, four, five
}

let personalCellIdentifier = "PDCell"
