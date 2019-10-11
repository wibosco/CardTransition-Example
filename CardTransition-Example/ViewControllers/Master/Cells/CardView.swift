//
//  CardView.swift
//  CardTransition-Example
//
//  Created by William Boles on 08/10/2019.
//  Copyright © 2019 William Boles. All rights reserved.
//

import UIKit

class CardView: UIView {
    @IBOutlet weak var title: UILabel!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Configure
    
    func configure(withViewModel viewModel: CardViewModel) {
        backgroundColor = viewModel.color
        title.text = viewModel.title
    }
}

class CardViewEmbeddableView: CardView {
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        guard let cardView = UIView.instantiateViewFromNib("CardView") as CardView? else {
            fatalError("Unable to load view from nib")
        }
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        for constraint in constraints {
            if constraint.secondItem != nil {
                cardView.addConstraint(NSLayoutConstraint(item: cardView, attribute: constraint.firstAttribute, relatedBy: constraint.relation, toItem: cardView, attribute: constraint.secondAttribute, multiplier: constraint.multiplier, constant: constraint.constant))
            } else {
                cardView.addConstraint(NSLayoutConstraint(item: cardView, attribute: constraint.firstAttribute, relatedBy: constraint.relation, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: constraint.constant))
            }
        }
        
        return cardView
    }
}
