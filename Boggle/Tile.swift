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
    var state : State
    
    enum State {
        case currentlySelected
        case used
        case unused
        case neighbour
    }
    
    init() {
        letter = "A"
        used = false
        state = State.unused
    }
    
    init(pLetter: String) {
        letter = pLetter
        used = false
        state = State.unused
    }
}
