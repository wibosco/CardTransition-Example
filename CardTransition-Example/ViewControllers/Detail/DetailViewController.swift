//
//  DetailViewController.swift
//  CardTransition-Example
//
//  Created by William Boles on 08/10/2019.
//  Copyright © 2019 William Boles. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var closeButton: UIButton!
    
    private var cardViewModel: CardViewModel!
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton.alpha = 0.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cardView.configure(withViewModel: cardViewModel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.closeButton.alpha = 1.0
        }, completion: nil)
    }
    
    // MARK: - Configure
    
    func configure(withViewModel viewModel: CardViewModel) {
        cardViewModel = viewModel
    }
    
    // MARK: - Actions
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
