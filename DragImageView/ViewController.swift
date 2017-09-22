//
//  ViewController.swift
//  DragImageView
//
//  Created by Jaxon Stevens on 9/22/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var carImage: UIButton!
    @IBOutlet weak var trashCan: UIButton!
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        //   view.addSubview(dragButton)
        view.addSubview(trashCan)
        view.addSubview(carImage)
        
        // Set the initial color of the color button
        trashCan.backgroundColor = UIColor.red
        
        // FISH ONE
        trashCan.addTarget(self, action: #selector(drag(control:event:)), for: UIControlEvents.touchDragInside)
        
        trashCan.addTarget(self, action: #selector(drag(control:event:)), for:
            UIControlEvents.touchDragExit)
        // FISH TWO
        carImage.addTarget(self, action: #selector(drag(control:event:)), for: UIControlEvents.touchDragInside)
        
        carImage.addTarget(self, action: #selector(drag(control:event:)), for:
            UIControlEvents.touchDragExit)
    }
    
    // BUTTON COLOR CHANGE FUNCTION TO CHANGE THE COLOR
    @IBAction func buttonChangedColor(_ sender: Any) {
        
        if carImage.backgroundColor == UIColor.red {
            carImage.backgroundColor = UIColor.blue
        }
        else if carImage.backgroundColor == UIColor.blue {
            carImage.backgroundColor = UIColor.red
            
        }
    }
    
    
    // BUTTON DRAG EVENTS
    @objc func drag(control: UIControl, event: UIEvent) {
        
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
        }
        
        
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
    }
    
    
}

