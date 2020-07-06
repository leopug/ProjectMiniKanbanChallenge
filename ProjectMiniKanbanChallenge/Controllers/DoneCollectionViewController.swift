//
//  DoneCollectionViewController.swift
//  ProjectMiniKanbanChallenge
//
//  Created by Leonardo Maia Pugliese on 06/07/20.
//  Copyright © 2020 Leonardo Maia Pugliese. All rights reserved.
//

import UIKit

class DoneCollectionViewController : NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var titles: [String] = ["One", "Two", "Three","testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest","testetteste"]
}

extension DoneCollectionViewController  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.reuseID, for: indexPath) as! CardCollectionViewCell
        cell.titleLabel.text = titles[indexPath.item]
        return cell
    }
}
