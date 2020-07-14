//
//  TodoCollectionViewController.swift
//  ProjectMiniKanbanChallenge
//
//  Created by Ana Caroline de Souza on 27/06/20.
//  Copyright © 2020 Leonardo Maia Pugliese. All rights reserved.
//

import UIKit

class TodoCollectionViewController : NSObject {
    
    var titles: [String] = ["One", "TwoTwoTwoTwoTwoTwoTwoTwoTwoTwoTwoTwoTwoTwoTwoTwoTwoTwoTwoTwoTwoTwo", "Three", "Four", "Five", "Six", "Seven", "Eight"]
}

extension TodoCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDragDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return [UIDragItem(itemProvider: NSItemProvider(item: "lol" as NSData, typeIdentifier: ))]
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.reuseID, for: indexPath) as! CardCollectionViewCell
        cell.titleLabel.text = titles[indexPath.item]
        return cell
    }
}
