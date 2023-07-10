//
//  AppDelegate.swift
//  macOS Monitor
//
//  Created by Basti SK on 14.08.18.
//  Copyright © 2018 Basti SK. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem: NSStatusItem
    let statusMenu: NSMenu;
    var timer: Timer!;
    
    override init() {
        statusItem = NSStatusBar.system.statusItem(withLength: 70)
        statusMenu = NSMenu.init(title: "Func Menu")
        let item: NSMenuItem
        
        item = NSMenuItem.init(title: "Quit", action: #selector(quit(_:)), keyEquivalent: "Q")
        statusMenu.addItem(item)
        

        super.init()
        statusItem.menu = statusMenu
        
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(refreshtemp(_:)), userInfo: nil, repeats: true);
        
        statusItem.title = "SK Temp"
        refreshtemp("");
    }
    
    public func drawTemp(value: String) {
        statusItem.title = value;
    }
    
    @IBAction func refreshtemp(_ sender: Any) {
        let temp = (SMCObjC.calculateTemp() - 32) * (5/9);
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        statusItem.title = formatter.string(from: temp as NSNumber)! + " °C";
    }
    
    @IBAction func quit(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

