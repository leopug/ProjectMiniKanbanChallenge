//
//  DoneCollectionViewController.swift
//  ProjectMiniKanbanChallenge
//
//  Created by Leonardo Maia Pugliese on 06/07/20.
//  Copyright © 2020 Leonardo Maia Pugliese. All rights reserved.
//

import UIKit

class DoneCollectionViewController : NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var cards: [String] = ["One", "Two", "Three","testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest","testetteste"]
}

extension DoneCollectionViewController  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.reuseID, for: indexPath) as! CardCollectionViewCell
        cell.titleLabel.text = cards[indexPath.item]
        return cell
    }
}

extension DoneCollectionViewController: UICollectionViewDragDelegate {
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = self.cards[indexPath.row]
        let itemProvider = NSItemProvider(object: item as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return [dragItem]
    }
}
