//
//  LocalState.swift
//  BankApp
//
//  Created by zhanybek salgarin on 6/5/23.
//

import Foundation

class LocalState {
    
    private enum Keys: String {
        case hasOnborded
    }
    
    static var hasOnborded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnborded.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnborded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
