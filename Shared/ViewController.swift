//
//  ViewController.swift
//  Boggle
//
//  Created by Constantin Koehler on 1/20/19.
//  Copyright © 2019 Constantin Koehler. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons_ButtonThemer

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    public let REUSEIDENTIFIER = "LetterTile"
    private let itemsPerRow: CGFloat = 4
    private var board: Board = Board()
    private let buttonScheme = MDCButtonScheme()

    @IBOutlet weak var shuffleButton: MDCButton!
    @IBOutlet weak var boardCollectionView: UICollectionView!
    
    @IBAction func onShuffleTap(_ sender: Any) {
        board = Board()
        boardCollectionView.reloadData()
        board.printBoard()
    }
    
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 4,
        minimumInteritemSpacing: 4,
        minimumLineSpacing: 4,
        sectionInset: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MDCOutlinedButtonThemer.applyScheme(buttonScheme, to: shuffleButton)
        shuffleButton.backgroundColor = UIColor.white
        
        boardCollectionView.delegate = self
        boardCollectionView.dataSource = self
        
        boardCollectionView.collectionViewLayout = columnLayout
        boardCollectionView.contentInsetAdjustmentBehavior = .always
        
        board.printBoard()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.Dice.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = boardCollectionView.dequeueReusableCell(withReuseIdentifier: REUSEIDENTIFIER, for: indexPath) as! LetterTileViewCell
        
        cell.letterLabel.text = board.getTileAt1DPosition(index: indexPath.row).letter
        cell.tile = board.getTileAt1DPosition(index: indexPath.row)
        
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.black.cgColor
        
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        return cell
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self.boardCollectionView)
        let indexPath = self.boardCollectionView.indexPathForItem(at: location)
        
        if let index = indexPath {
            print("Got clicked on index: \(index.row)!")
            
            let cell = self.boardCollectionView.cellForItem(at: index) as! LetterTileViewCell
            let tile = cell.tile
            let isUsed = !tile.used
            
        }
    }

}