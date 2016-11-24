//
//  ViewController.swift
//  StackViewTest
//
//  Created by Maciej Trybilo on 22/11/2016.
//  Copyright © 2016 JUST EAT. All rights reserved.
//

import UIKit

class ViewController: ScrollingStackViewController {
    
    var viewControllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.spacing = 16
        
        for _ in 1...10 {
            
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SteppersViewController") as! SteppersViewController
            
            viewControllers += [viewController]
            
            add(viewController: viewController)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            
            self.hide(viewController: self.viewControllers[2])
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            
            self.show(viewController: self.viewControllers[2])
        }
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapViewController")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            
            self.insert(viewController: viewController, at: 2)
        }
    }
}

