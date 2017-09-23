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
    


    // Call these functions when the user clicks the defined image
    @IBAction func carImageDidTouch(_ sender: Any) {
        // Hide the Image when the user drags it to trash
        
        // if the carImage frame intersects with the trash can frame then execute the code below
        if (carImage.frame.intersects(trashCan.frame)) {
        
        // Hide the car image
        carImage.isHidden = true
       // set the image to nil 
        self.carImage = nil
        print("carImage is now hidden")
        } else {
            // Center image in VC if the image is not in the trash
            carImage.center = self.view.center
           // print("Car image is not hidden")
        }
        
    }
    
    
    @IBAction func coffeeMugImageDidTouch(_ sender: Any) {
        
        // if the coffeeMugImage frame intersects with the trash can frame then execute the code below
        if (coffeeMugImage.frame.intersects(trashCan.frame)) {
            
        coffeeMugImage.isHidden = true
        // Set the image to nil
        self.coffeeMugImage = nil
        print("coffeeMugImage is now hidden")
    } else {
    // Center image in VC if the image is not in the trash
     coffeeMugImage.center = self.view.center

   // print("coffeeMugImage is not hidden")
    }
    
    }
    
// If you have more objects then two I would create an array of objects and iterate them through a for loop to check is they intersect with the trash can
    
    // Also currently this does not delete the object and only hides it, It would be a good idea to destroy the object for a production app as the image is still being stored in memory and just being hidden from the user in this case
    
    // Button Drag Event
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

