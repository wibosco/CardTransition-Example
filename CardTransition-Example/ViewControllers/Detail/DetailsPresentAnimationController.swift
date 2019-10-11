//
//  DetailsPresentAnimationController.swift
//  CardTransition-Example
//
//  Created by William Boles on 09/10/2019.
//  Copyright © 2019 William Boles. All rights reserved.
//

import UIKit

class DetailsPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    private let startingFrame: CGRect
    
    // MARK: - Init
    
    init(withStartingFrame startingFrame: CGRect) {
        self.startingFrame = startingFrame
        super.init()
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let snapshotImageView = toViewController.view.snapshotImageView()
            else {
                return
        }
        
        let containerView = transitionContext.containerView
        
        snapshotImageView.contentMode = .top
        snapshotImageView.layer.cornerRadius = 10
        snapshotImageView.clipsToBounds = true
        snapshotImageView.frame = startingFrame
    
        containerView.addSubview(snapshotImageView)

        toViewController.view.isHidden = true
        
        containerView.addSubview(toViewController.view)
        
        let duration = transitionDuration(using: transitionContext)
        let finalFrame = transitionContext.finalFrame(for: toViewController)
        
        UIView.animateKeyframes(
            withDuration: duration,
            delay: 0,
            options: .calculationModeLinear,
            animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 2/3) {
                    snapshotImageView.frame = CGRect(x: snapshotImageView.frame.origin.x, y: 0, width: snapshotImageView.frame.size.width, height: finalFrame.height)
                }

                UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 2/3) {
                    snapshotImageView.frame = finalFrame
                    snapshotImageView.layer.cornerRadius = 0
                }
        },
            completion: { _ in
                toViewController.view.isHidden = false
                snapshotImageView.removeFromSuperview()
                transitionContext.completeTransition(true)

        })
    }
}
