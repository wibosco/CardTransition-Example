//
//  MasterViewController.swift
//  CardTransition-Example
//
//  Created by William Boles on 08/10/2019.
//  Copyright © 2019 William Boles. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var cardViewModels: [CardViewModel] = {
        var cardViewModels = [CardViewModel]()
        cardViewModels.append(CardViewModel(title: "A", color: UIColor.randomPastelColor))
        cardViewModels.append(CardViewModel(title: "B", color: UIColor.randomPastelColor))
        cardViewModels.append(CardViewModel(title: "C", color: UIColor.randomPastelColor))
        cardViewModels.append(CardViewModel(title: "D", color: UIColor.randomPastelColor))
        cardViewModels.append(CardViewModel(title: "E", color: UIColor.randomPastelColor))
        cardViewModels.append(CardViewModel(title: "F", color: UIColor.randomPastelColor))
        
        return cardViewModels
    }()
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        layout.itemSize = CGSize(width: view.frame.width, height: 420)
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as? CardCollectionViewCell else {
            fatalError("Unexpected cell type")
        }
        
        let cardViewModel = cardViewModels[indexPath.item]
        
        cell.configure(withViewModel: cardViewModel)
        
        return cell
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsViewController = segue.destination as? DetailViewController,
            let cell = sender as? CardCollectionViewCell,
            let indexPath = collectionView.indexPath(for: cell),
            let detailSegue = segue as? DetailsSegue {
                let cardViewModel = cardViewModels[indexPath.item]
                let startingPoint = cell.superview!.convert(cell.frame.origin, to: nil)
                let startingFrame = CGRect(x: startingPoint.x + cell.cardView.frame.origin.x, y: startingPoint.y + cell.cardView.frame.origin.y, width: cell.cardView.frame.size.width, height: cell.cardView.frame.size.height)
                detailSegue.startingFrame = startingFrame
                detailsViewController.configure(withViewModel: cardViewModel)
        }
    }
}
