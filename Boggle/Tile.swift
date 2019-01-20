//
//  Tile.swift
//  Boggle
//
//  Created by Constantin Koehler on 1/20/19.
//  Copyright © 2019 Constantin Koehler. All rights reserved.
//

import Foundation

class Tile {
    
    var letter : String
    var used : Bool
    
    init() {
        letter = "A"
        used = false
    }
    
    init(pLetter: String) {
        letter = pLetter
        used = false
    }
}
