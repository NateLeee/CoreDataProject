//
//  Predicate.swift
//  CoreDataProject
//
//  Created by Nate Lee on 7/26/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import Foundation

enum Predicate {
    case beginsWith(key: String, value: String, caseSensitive: Bool)
    
    var predicateString: String {
        var str = ""
        
        switch self {
        case .beginsWith(let key, let value, let caseSensitive):
            if (caseSensitive) {
                str = "\(key) BEGINSWITH '\(value)'"
            } else {
                str = "\(key) BEGINSWITH[c] '\(value)'"
            }
        default: break
        }
        
        return str
    }
}
