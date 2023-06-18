//
//  File.swift
//  BankApp
//
//  Created by zhanybek salgarin on 6/13/23.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
