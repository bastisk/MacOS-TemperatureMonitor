//
//  ViewController.swift
//  macOS Monitor
//
//  Created by Basti SK on 14.08.18.
//  Copyright © 2018 Basti SK. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {
    @IBOutlet weak var innolabel: NSTextField!
    var timer: Timer!;
    
    
    @IBAction func tempbutton(_ sender: Any) {
        let temp = (SMCObjC.calculateTemp() - 32) * (5/9);
        innolabel.stringValue = String(temp) + " °C";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tempbutton(_:)), userInfo: nil, repeats: true);

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

