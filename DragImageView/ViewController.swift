//
//  ViewController.swift
//  DragImageView
//
//  Created by Jaxon Stevens on 9/22/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit
import JSSAlertView

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
    
    @IBAction func checkTrash(_ sender: Any) {
        
        checkToSeeIfTrashIsFull()

    }
    // Call this function to alert the user the item has been dragged to the trash
    func alertUserView() {
     var dragAlertView = JSSAlertView().show(self,
     title: "Item Dragged To Trash",
     text: "Item now removed from view!",
     color: UIColorFromHex (0xFB5F68, alpha: 1))
        
        // Set the color theme of this JSS Alert View to white
        dragAlertView.setTextTheme(.light)
        // Check to see if the trash is full
        
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
        // Call the alert function
        alertUserView()
        print("carImage is now hidden")
        } else {
            // Center image in VC if the image is not in the trash
            carImage.center = self.view.center
           // print("Car image is not hidden")
            
        }
        
    }
    
    // Check to see if the trash is full when the user clicks on 
    func checkToSeeIfTrashIsFull() {
        
        // If both images equal nil then execute the code to show an alert screen is clear
        if (self.carImage == nil && coffeeMugImage == nil) {
            
            var trashFullAlert = JSSAlertView().show(self,
             title: "Screen Is Clear",
             text: "You have dragged both objects to the trash and your screen is now clear!",
             color: UIColorFromHex (0x40D98C, alpha: 1))
             trashFullAlert.setTextTheme(.light)
        } else {
            
            var trashClearAlert = JSSAlertView().show(self,
            title: "The trash is not full yet",
            text: "You still have to drag another object into the trash to clear your screen!",
            color: UIColorFromHex (0xFED431, alpha: 1))
            trashClearAlert.setTextTheme(.light)
            
            
            
        }

    }
    
    
    @IBAction func coffeeMugImageDidTouch(_ sender: Any) {
        
        // if the coffeeMugImage frame intersects with the trash can frame then execute the code below
        if (coffeeMugImage.frame.intersects(trashCan.frame)) {
            
        coffeeMugImage.isHidden = true
        // Set the image to nil
        self.coffeeMugImage = nil
        // Call the alert function
        alertUserView()
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

