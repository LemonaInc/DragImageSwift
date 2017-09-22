//
//  ViewController.swift
//  DragImageView
//
//  Created by Jaxon Stevens on 9/22/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var coffeeMugImage: UIButton!
    @IBOutlet weak var carImage: UIButton!
    @IBOutlet weak var trashCan: UIButton!
    
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        //   view.addSubview(dragButton)
        view.addSubview(trashCan)
        view.addSubview(carImage)
        view.addSubview(coffeeMugImage)
        
        // Set the initial color of the color button
        trashCan.backgroundColor = UIColor.red
        
        // Car Image Control Events
        carImage.addTarget(self, action: #selector(drag(control:event:)), for: UIControlEvents.touchDragInside)
        
        carImage.addTarget(self, action: #selector(drag(control:event:)), for:
            UIControlEvents.touchDragExit)
        
        // Coffee Mug Control Events
        coffeeMugImage.addTarget(self, action: #selector(drag(control:event:)), for: UIControlEvents.touchDragInside)
        
        coffeeMugImage.addTarget(self, action: #selector(drag(control:event:)), for:
            UIControlEvents.touchDragExit)
        
        
    }
    
    @IBAction func carImageDidTouch(_ sender: Any) {
        
        // Hide the Image when the user drags it to trash
        if (carImage.frame.intersects(trashCan.frame)) {
            
        carImage.isHidden = true
        print("carImage is now hidden")
        } else {
            
            print("image is not hidden")
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

