//
//  CardCollectionViewCell.swift
//  ProjectMiniKanbanChallenge
//
//  Created by Ana Caroline de Souza on 27/06/20.
//  Copyright © 2020 Leonardo Maia Pugliese. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    var roundedBackgroundView: UIView!
    var titleLabel: UILabel!
    static let reuseID = "cardCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        configureRoundedBackgroundView()
        configureTitleLabel()
    }
    
    func configureRoundedBackgroundView() {
        roundedBackgroundView = UIView()
        self.contentView.addSubview(roundedBackgroundView)
        roundedBackgroundView.layer.cornerRadius = 10
        roundedBackgroundView.layer.borderColor = UIColor.systemGray.cgColor
        roundedBackgroundView.layer.borderWidth = 1
        roundedBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        roundedBackgroundView.backgroundColor = .systemRed
        
        NSLayoutConstraint.activate([
            roundedBackgroundView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            roundedBackgroundView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            roundedBackgroundView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
    }
    
    func configureTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 10)
        titleLabel.textColor = .systemBlue
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byTruncatingTail
        roundedBackgroundView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: roundedBackgroundView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: roundedBackgroundView.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: roundedBackgroundView.trailingAnchor, constant: -5),
            titleLabel.heightAnchor.constraint(equalTo: roundedBackgroundView.heightAnchor, multiplier: 0.8)
        ])
    }
    
}
