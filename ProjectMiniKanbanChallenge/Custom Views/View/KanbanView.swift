//
//  MiniKanbanView.swift
//  ProjectMiniKanbanChallenge
//
//  Created by Ana Caroline de Souza on 27/06/20.
//  Copyright © 2020 Leonardo Maia Pugliese. All rights reserved.
//

import UIKit

class KanbanView: UIView {
    
    typealias CollectionViewDelegate = UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDragDelegate
    
    var titleLabel : UILabel!
    var todoCollectionView : UICollectionView!
    var doingCollectionView : UICollectionView!
    var doneCollectionView : UICollectionView!
    var padding : CGFloat = 15
    var todoDelegate : CollectionViewDelegate!
    var doingDelegate : CollectionViewDelegate!
    var doneDelegate : CollectionViewDelegate!

    
    init(frame: CGRect, todoDelegate: CollectionViewDelegate, doingDelegate: CollectionViewDelegate, doneDelegate: CollectionViewDelegate) {
        super.init(frame: frame)
        self.todoDelegate = todoDelegate
        self.doingDelegate = doingDelegate
        self.doneDelegate = doneDelegate
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .systemGreen
        configureTitleLabel()
        configureCollectionsViews()
    }
    
    private func configureTitleLabel() {
        titleLabel = MKTitleLabel(textAlignment: .left, fontSize: 36)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.text = "Card.io"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureCollectionsViews() {
        
        configureTodoCollectionView()
        configureDoingCollectionView()
        configureDoneCollectionView()
        
    }
    
    func configureDoneCollectionView() {
        doneCollectionView = UICollectionView.createViewCodeUICollectionView(self, layout: collectionViewLayout())
        doneCollectionView.delegate = doneDelegate
        doneCollectionView.dataSource = doneDelegate
        doneCollectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.reuseID)
        
        doneCollectionView.backgroundColor = .clear

        NSLayoutConstraint.activate([
            doneCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            doneCollectionView.leadingAnchor.constraint(equalTo: doingCollectionView.trailingAnchor),
            doneCollectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            doneCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    private func configureDoingCollectionView() {
        doingCollectionView = UICollectionView.createViewCodeUICollectionView(self, layout: collectionViewLayout())
        doingCollectionView.delegate = doingDelegate
        doingCollectionView.dataSource = doingDelegate
        doingCollectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.reuseID)
        
        doingCollectionView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            doingCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            doingCollectionView.leadingAnchor.constraint(equalTo: todoCollectionView.trailingAnchor),
            doingCollectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            doingCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureTodoCollectionView() {
        todoCollectionView = UICollectionView.createViewCodeUICollectionView(self, layout: collectionViewLayout())
        todoCollectionView.delegate = todoDelegate
        todoCollectionView.dataSource = todoDelegate
        todoCollectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.reuseID)
        todoCollectionView.dragDelegate = todoDelegate
        
        todoCollectionView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            todoCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            todoCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            todoCollectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            todoCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()

        let size = CGSize(width: UIScreen.main.bounds.width * 0.29, height: 160)
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = size
        return layout
    }
    
}
