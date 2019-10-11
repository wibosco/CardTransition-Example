//
//  CardCollectionViewCell.swift
//  CardTransition-Example
//
//  Created by William Boles on 08/10/2019.
//  Copyright © 2019 William Boles. All rights reserved.
//

import UIKit

struct CardViewModel {
    let title: String
    let color: UIColor
}

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cardView: CardView!
    
    // MARK: - ViewLifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cardView.layer.cornerRadius = 10
    }
    
    // MARK: - Configure
    
    func configure(withViewModel viewModel: CardViewModel) {
        cardView.configure(withViewModel: viewModel)
    }
}
