//
//  ViewController.swift
//  Boggle
//
//  Created by Constantin Koehler on 1/20/19.
//  Copyright © 2019 Constantin Koehler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    public let REUSEIDENTIFIER = "LetterTile"
    private let itemsPerRow: CGFloat = 4
    private let SECOUNDSINROUND = 30

    private var board: Board = Board()

    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var boardCollectionView: UICollectionView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var timerSeconds = 0
    var timer : Timer?
    
    @IBAction func onShuffleTap(_ sender: Any) {
        print("Shuffling the Board")
        board = Board()
        boardCollectionView.reloadData()
        board.printBoard()
        timerSeconds = SECOUNDSINROUND
        setTimer()
    }
    
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 4,
        minimumInteritemSpacing: 4,
        minimumLineSpacing: 4,
        sectionInset: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        boardCollectionView.delegate = self
        boardCollectionView.dataSource = self
        
        boardCollectionView.collectionViewLayout = columnLayout
        boardCollectionView.contentInsetAdjustmentBehavior = .always
        
        board.printBoard()
        
        setTimer()

        timerSeconds = SECOUNDSINROUND
    }
    
    func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer() {
        timerSeconds -= 1
        timerLabel.text = String(timerSeconds)
        
        if(timerSeconds <= 0){
            timer?.invalidate()
            SoundPlayer().playSound()
        } else if(timerSeconds < 10){
            timerLabel.textColor = UIColor.red
        } else if(timerSeconds < SECOUNDSINROUND / 2){
            timerLabel.textColor = UIColor.yellow
        }
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
