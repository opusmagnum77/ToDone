//
//  ViewController.swift
//  ToDone
//
//  Created by Daniel Adeyanju on 12/2/16.
//  Copyright © 2016 Daniel Adeyanju. All rights reserved.
//

import UIKit

class TDFirstVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func addToDo(_ sender: AnyObject) {
     
    }
    @IBOutlet weak var toDoTableView: UITableView!
    var toDoArray = [String]()
    var toDoArrayDate = [Date]()
    var refresher: UIRefreshControl? //necessary
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        
        if UserDefaults.standard.array(forKey: "toDoArray") == nil  {
          toDoArray = [String]()
            UserDefaults.standard.set(toDoArray, forKey: "todoArray")
            
        } else {
            toDoArray = UserDefaults.standard.array(forKey: "toDoArray") as! [String]
            //print("vc1 print todoarray: \(UserDefaults.standard.array(forKey: "toDoArray")!)")



        }
        refresher = UIRefreshControl()
        refresher?.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        
        refresher?.addTarget(self, action: #selector(TDFirstVC.refresh), for: UIControlEvents.valueChanged)
        
        toDoTableView.addSubview(refresher!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            UserDefaults.standard.set(toDoArray, forKey: "toDoArray")
            UserDefaults.standard.set(toDoArrayDate, forKey: "toDoArrayDate")

            
        }
    }
    

    func refresh(){

        self.toDoArray = UserDefaults.standard.array(forKey: "toDoArray") as! [String]
        self.toDoTableView.reloadData()
        self.refresher?.endRefreshing()

    }
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = toDoArray[indexPath.row]
        let dateformatter = DateFormatter()
        
        dateformatter.dateStyle = DateFormatter.Style.short
        
        dateformatter.timeStyle = DateFormatter.Style.short
        
        let dateString = dateformatter.string(from: NSDate() as Date)
        cell?.detailTextLabel?.text = dateString
        return cell!
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

