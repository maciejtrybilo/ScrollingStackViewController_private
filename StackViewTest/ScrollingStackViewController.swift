//
//  ScrollingStackViewController.swift
//  StackViewTest
//
//  Created by Maciej Trybilo on 24/11/2016.
//  Copyright © 2016 JUST EAT. All rights reserved.
//

import UIKit

public class ScrollingStackViewController: UIViewController {
    
    public let scrollView: UIScrollView = UIScrollView()
    public let stackView: UIStackView = UIStackView()
    
    override public func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.axis = .vertical
        
        let views = ["scrollView" : scrollView,
                     "stackView" : stackView,
                     "topGuide" : topLayoutGuide,
                     "bottomGuide" : bottomLayoutGuide] as [String : Any]
        
        var constraints = [NSLayoutConstraint]()
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[topGuide][scrollView][bottomGuide]", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: [], metrics: nil, views: views)
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView]|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView(==scrollView)]|", options: [], metrics: nil, views: views)
        
        NSLayoutConstraint.activate(constraints)
    }
    
    public func add(viewController: UIViewController) {
        
        addChildViewController(viewController)
        viewController.didMove(toParentViewController: self)
        
        UIView.performWithoutAnimation {
            hide(viewController: viewController)
        }
        
        stackView.addArrangedSubview(viewController.view)
        
        show(viewController: viewController)
    }
    
    public func insert(viewController: UIViewController, at index: Int) {
        
        addChildViewController(viewController)
        viewController.didMove(toParentViewController: self)
        
        UIView.performWithoutAnimation {
            hide(viewController: viewController)
        }
        
        stackView.insertArrangedSubview(viewController.view, at: index)
        
        show(viewController: viewController)
    }
    
    public func remove(viewController: UIViewController) {
        
        stackView.removeArrangedSubview(viewController.view)
        
        viewController.removeFromParentViewController()
    }
    
    public func show(viewController: UIViewController) {
        
        animate {
            viewController.view.alpha = 1
            viewController.view.isHidden = false
        }
    }
    
    public func hide(viewController: UIViewController) {
        
        animate {
            viewController.view.alpha = 0
            viewController.view.isHidden = true
        }
    }
    
    private func animate(_ animations: @escaping (Void) -> ()) {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        
                        animations()
                        
        }, completion: nil)
    }
}
