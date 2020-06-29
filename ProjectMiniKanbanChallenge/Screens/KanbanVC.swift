//
//  ViewController.swift
//  ProjectMiniKanbanChallenge
//
//  Created by Ana Caroline de Souza on 27/06/20.
//  Copyright © 2020 Leonardo Maia Pugliese. All rights reserved.
//

import UIKit

class KanbanVC: UIViewController {

    override func loadView() {
        super.loadView()
        view = KanbanView(frame: view.bounds, todoDelegate: TodoCollectionViewController(), doingDelegate: DoingCollectionViewController())
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        let kanbanView = view as! KanbanView

        if UIDevice.current.orientation.isLandscape,
            let layout = kanbanView.todoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            //let cellWidthHeightConstant: CGFloat = UIScreen.main.bounds.width * 0.29
//
//                   //let width = UIScreen.main.bounds.width - 22
//            //        let size = CGSize(width: width - 16, height: 160)
//
//                    //let width = UIScreen.main.bounds.width - 22
//                    let size = CGSize(width: UIScreen.main.bounds.width * 0.29, height: 160)
//
//                    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//                    layout.scrollDirection = .vertical
//                    layout.minimumInteritemSpacing = 0
//                    layout.minimumLineSpacing = 0
//                    //layout.itemSize = CGSize(width: cellWidthHeightConstant, height: cellWidthHeightConstant)
//                    layout.itemSize = size
//            layout.invalidateLayout()
            
        } else if UIDevice.current.orientation.isPortrait,
            let layout = kanbanView.todoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                    //let cellWidthHeightConstant: CGFloat = UIScreen.main.bounds.width * 0.29
//
//                   //let width = UIScreen.main.bounds.width - 22
//            //        let size = CGSize(width: width - 16, height: 160)
//
//                    //let width = UIScreen.main.bounds.width - 22
//                    let size = CGSize(width: UIScreen.main.bounds.width * 0.28, height: 160)
//
//                    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//                    layout.scrollDirection = .vertical
//                    layout.minimumInteritemSpacing = 0
//                    layout.minimumLineSpacing = 0
//                    //layout.itemSize = CGSize(width: cellWidthHeightConstant, height: cellWidthHeightConstant)
//                    layout.itemSize = size
//            layout.invalidateLayout()
            
        }
    }
    
    
}

