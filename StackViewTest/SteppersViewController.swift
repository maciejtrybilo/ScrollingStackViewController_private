//
//  SteppersViewController.swift
//  StackViewTest
//
//  Created by Maciej Trybilo on 24/11/2016.
//  Copyright © 2016 JUST EAT. All rights reserved.
//

import UIKit

class SteppersViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var stepper2: UIStepper!
    @IBOutlet weak var stepper3: UIStepper!
    @IBOutlet weak var stepper4: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper2.tintColor = UIColor.black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            UIView.animate(withDuration: 0.5) {
                self.stepper2.alpha = 0
                self.stepper2.isHidden = true
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            UIView.animate(withDuration: 0.5) {
                self.stepper2.alpha = 1
                self.stepper2.isHidden = false
            }
        }
    }

}
