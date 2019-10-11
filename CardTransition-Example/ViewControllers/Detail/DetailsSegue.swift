//
//  DetailsSegue.swift
//  CardTransition-Example
//
//  Created by William Boles on 09/10/2019.
//  Copyright © 2019 William Boles. All rights reserved.
//

import UIKit

class DetailsSegue: UIStoryboardSegue, UIViewControllerTransitioningDelegate {
    var startingFrame: CGRect?
    
    // MARK: - Perform
    
    override func perform() {
        destination.transitioningDelegate = self
        super.perform()
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let startingFrame = startingFrame else {
            fatalError("Missing required dependencies")
        }
        return DetailsPresentAnimationController(withStartingFrame: startingFrame)
    }
}
