//
//  CollectionViewCellTransitionAnimator.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 08.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class CollectionViewCellTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Private proeprties
    
    private let startTransitionCell: UICollectionViewCell
    
    // MARK: - Init
    
    init(startTransitionCell: UICollectionViewCell) {
        self.startTransitionCell = startTransitionCell
    }
    

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let presentedViewController = transitionContext.viewController(forKey: .to), let presentedView = transitionContext.view(forKey: .to), let sourceView = transitionContext.view(forKey: .from) else {
            transitionContext.completeTransition(false)
            return
        }
        
        let finalFrame = transitionContext.finalFrame(for: presentedViewController)
        let startCellFrame = startTransitionCell.convert(startTransitionCell.bounds, to: containerView)
        let startCellCenter = CGPoint(x: startCellFrame.midX, y: startCellFrame.midY)
        
        let cicleView = createCicrleView(view: presentedView)
        
        containerView.addSubview(cicleView)
        containerView.addSubview(presentedView)
        
        presentedView.center = startCellCenter
        presentedView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        
        cicleView.center = presentedView.center
        cicleView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentedView.transform = CGAffineTransform(scaleX: 1, y: 1)
            presentedView.frame = finalFrame
            
            
            cicleView.transform = CGAffineTransform(scaleX: 1, y: 1)
            cicleView.center = presentedView.center
            
        }) { (finished) in
            transitionContext.completeTransition(finished)
        }
        
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    private func createCicrleView(view: UIView) -> UIView {
        let diametr = sqrt(view.bounds.width * view.bounds.height + view.bounds.width * view.bounds.height) * 1.3
        let circleView = UIView(frame: CGRect(x: 0, y: 0, width: diametr, height: diametr))
        circleView.layer.cornerRadius = diametr/2
        circleView.layer.masksToBounds = true
        
        circleView.backgroundColor = view.backgroundColor
        
        return circleView
    }
    
    
    
}
