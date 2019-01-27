//
//  BoardWorker.swift
//  Boggle
//
//  Created by Constantin Koehler on 1/20/19.
//  Copyright © 2019 Constantin Koehler. All rights reserved.
//

import Foundation

class Board {
    
    private var tiles: [[Tile]] = [
        [Tile(),Tile(),Tile(),Tile()],
        [Tile(),Tile(),Tile(),Tile()],
        [Tile(),Tile(),Tile(),Tile()],
        [Tile(),Tile(),Tile(),Tile()]
    ]
    
    public var currentString = ""
    
    init() {
        var boardIndicesArray = Constants.BoardIndices.shuffled()
        var counter = 0
        
        for rowNum in 0..<Constants.ROWSIZE {
            for colNum in 0..<Constants.ROWSIZE {
                let dieFaceIndex = Int.random(in: 0..<Constants.DICE_FACES)
                let die = Constants.Dice[boardIndicesArray[counter]]
                let letter = die[dieFaceIndex]
                
                let tile = Tile(pLetter: letter, id: counter)
                tiles[rowNum][colNum] = tile
                counter += 1
            }
        }
    }
    
    func printBoard() {
        for rowNum in 0..<Constants.ROWSIZE {
            for colNum in 0..<Constants.ROWSIZE {
                print(tiles[rowNum][colNum].letter,terminator:" ")
            }
            print()
        }
    }
    
    func getTileAt1DPosition(index: Int) -> Tile {
        let tileArr = tiles.flatMap { $0 }
        return tileArr[index]
    }
}
