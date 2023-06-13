//
//  MainTableViewCellModel.swift
//  BankApp
//
//  Created by zhanybek salgarin on 6/13/23.
//

import Foundation

struct MainTableViewCellModel {
    
    enum AccountType: String {
        case bank, creditCard, checking
    }
    
    let accoundType: AccountType
    let accountName: String
}
