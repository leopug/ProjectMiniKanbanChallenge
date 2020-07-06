//
//  ViewController.swift
//  ProjectMiniKanbanChallenge
//
//  Created by Ana Caroline de Souza on 27/06/20.
//  Copyright © 2020 Leonardo Maia Pugliese. All rights reserved.
//

import UIKit

class KanbanVC: UIViewController {

    typealias CollectionViewDelegate = UICollectionViewDelegate & UICollectionViewDataSource

    var todoDelegate: TodoCollectionViewController?
    var doingDelegate: DoingCollectionViewController?
    
    
    override func loadView() {
        super.loadView()
        view = KanbanView(frame: view.bounds, todoDelegate: TodoCollectionViewController(), doingDelegate: DoingCollectionViewController(), doneDelegate: DoneCollectionViewController())
    }
    
    init(todoDelegate: TodoCollectionViewController , doingDelegate: DoingCollectionViewController) {
        super.init(nibName: nil, bundle: nil)
        self.todoDelegate = todoDelegate
        self.doingDelegate = doingDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        guard let kanbanView = view as? KanbanView,
            let todoLayout = kanbanView.todoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout,
            let doingLayout = kanbanView.doingCollectionView.collectionViewLayout as? UICollectionViewFlowLayout,
            let doneLayout = kanbanView.doneCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        else { return }
        
        let layouts = [todoLayout,doingLayout,doneLayout]
        
        for layout in layouts {
            let newSize = CGSize(width: size.width * 0.29, height: 160)
            layout.itemSize = newSize
            layout.invalidateLayout()
        }
    }
    
    
}

