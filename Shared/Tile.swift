//
//  Tile.swift
//  Boggle
//
//  Created by Constantin Koehler on 1/20/19.
//  Copyright © 2019 Constantin Koehler. All rights reserved.
//

import Foundation
import RxDataSources


struct Tile: IdentifiableType, Equatable {
    
    var id : Int
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
        id = 0
        letter = "A"
        used = false
        state = State.unused
    }
    
    init(pLetter: String, id: Int) {
        self.id = id
        letter = pLetter
        used = false
        state = State.unused
    }
    
    var identity: Int {
        return id
    }
}
