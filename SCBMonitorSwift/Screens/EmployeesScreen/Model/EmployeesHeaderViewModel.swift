//
//  EmployeesHeaderViewModel.swift
//  SCBMonitorSwift
//
//  Created by Renat Murtazin on 12.07.2022.
//

import Foundation

struct EmployeesHeaderViewModel {
    
    let titleText: String
    let cells: [EmployeeCellViewModel]
    var isExpanded: Bool
}
