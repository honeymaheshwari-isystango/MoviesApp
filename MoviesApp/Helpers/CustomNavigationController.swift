//
//  CustomNavigationController.swift
//  TestMovies
//
//  Created by stplmacmini5 on 30/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    var interactionController: UIPercentDrivenInteractiveTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        transitioningDelegate = self
        delegate = self
        let top = UIPanGestureRecognizer(target: self, action: #selector(handleSwipeFromTop(_:)))
        self.view.addGestureRecognizer(top)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleSwipeFromTop(_ gesture: UIPanGestureRecognizer) {
        let percent = gesture.translation(in: gesture.view).y / gesture.view!.bounds.size.height
        switch gesture.state {
        case .began:
            if viewControllers.count > 1 {
                popViewController(animated: true)
            } else {
                dismiss(animated: true, completion: nil)
            }
        case .changed:
            interactionController?.update(percent)
        case .ended:
            if percent > 0.5 {
                interactionController?.finish()
            } else {
                interactionController?.cancel()
            }
            interactionController = nil
        default:
            break
        }
    }
    
}

extension CustomNavigationController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ForwardAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BackAnimator()
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
    
}

extension CustomNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return ForwardAnimator()
        case .pop:
            return BackAnimator()
        case .none:
            return nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
    
}

///For forward animation
class ForwardAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)?.view
        transitionContext.containerView.addSubview(toView!)
        toView!.alpha = 0.0
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView!.alpha = 1.0
        }) { (completed) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}

/// For back animation
class BackAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)?.view
        let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)?.view
        transitionContext.containerView.insertSubview(toView!, belowSubview: fromView!)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView!.alpha = 0.0
        }) { (completed) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}



