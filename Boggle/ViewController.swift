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

    @IBOutlet weak var boardCollectionView: UICollectionView!
    
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
//        boardCollectionView.register(LetterTileViewCell.self, forCellWithReuseIdentifier: REUSEIDENTIFIER)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.Dice.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = boardCollectionView.dequeueReusableCell(withReuseIdentifier: REUSEIDENTIFIER, for: indexPath) as! LetterTileViewCell
        
        cell.letterLabel.text = "Qu"
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.black.cgColor
        
        return cell
    }
    

}
