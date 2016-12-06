//
//  TDSecondVC.swift
//  ToDone
//
//  Created by Daniel Adeyanju on 12/4/16.
//  Copyright © 2016 Daniel Adeyanju. All rights reserved.
//

import UIKit

class TDSecondVC: UIViewController {
    @IBOutlet weak var newToDoText: UITextField!
    @IBAction func addToDo(_ sender: AnyObject) {
        //UserDefaults.standard.array(forKey: "toDoArray")?.append(newToDoText.text)
        var currentToDoArray = UserDefaults.standard.array(forKey: "toDoArray")
        currentToDoArray!.append(newToDoText.text!)
        //why didn't this work - UserDefaults.standard.set( value: currentToDoArray , forKey: "toDoArray")

        UserDefaults.standard.setValue(currentToDoArray!, forKey: "toDoArray")
        print("vc2 print todoarray: \(UserDefaults.standard.array(forKey: "toDoArray"))");
        
        
        
        self.dismiss(animated: true)
    }
    @IBAction func closeVC(_ sender: AnyObject) {
        
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
