//
//  ViewController.swift
//  SOFlashLight
//
//  Created by Hitesh on 11/29/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var isTourch = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func actionTorchClick(sender: AnyObject) {
        
        guard let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo) else { return }
        
        if device.hasTorch {
            isTourch = !isTourch
            do {
                try device.lockForConfiguration()
                
                if isTourch == true {
                    device.torchMode = .On
                } else {
                    device.torchMode = .Off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch is not working.")
            }
        } else {
            print("Torch not compitible with device.")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

