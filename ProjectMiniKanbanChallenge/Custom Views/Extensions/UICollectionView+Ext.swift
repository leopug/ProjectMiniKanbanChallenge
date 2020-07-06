//
//  UICollectionView+Ext.swift
//  ProjectMiniKanbanChallenge
//
//  Created by Leonardo Maia Pugliese on 06/07/20.
//  Copyright © 2020 Leonardo Maia Pugliese. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    static func createViewCodeUICollectionView(_ view: UIView, layout: UICollectionViewFlowLayout) -> UICollectionView {
        let collectioView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectioView)
        collectioView.translatesAutoresizingMaskIntoConstraints = false
        return collectioView
    }
}
