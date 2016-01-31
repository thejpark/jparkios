//
//  MasterViewController.swift
//  singleview
//
//  Created by Park Jung Gyu on 15/10/2015.
//  Copyright © 2015 pyfamily. All rights reserved.
//

import UIKit

class Elem {
    var surName : Hanja
    var givenName : [Hanja]
    init (name:[Hanja]) {
        surName = name[0]
        givenName = [Hanja]()
        for var i = 1; i < name.count; ++i {
            givenName.append(name[i])
        }
    }
    func desc() -> String {
        var r: String
        r = surName.0
        for e in givenName {
            r += e.0
        }
        r += " ("
        for var i = 0; i < givenName.count; ++i {
            r += givenName[i].1
            if (i != givenName.count - 1) {
                r += ", "
            }
        }
        r += ")"
        
        return r
    }
}

class MasterViewController: UITableViewController {
    
    var objects = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func search(surName: String, surNameH: String, givenName: String) {
        var gname: [Hanja] = [Hanja]()
      
      //  for var i = 0; i < givenName.characters.count; ++i {
      //      let index = givenName.startIndex.advancedBy(i)
      //      var hanja : [Hanja] = getHanjaDataFromHangul(String(givenName[index]))
      //      gname.append(hanja[0])
      //  }
        
        let index = givenName.startIndex.advancedBy(0)
        gname = getHanjaDataFromHangul(String(givenName[index]))
        
        for g in gname {
            var name: [Hanja] = [Hanja]()
            name.append(getHanjaData(surName, hanja: surNameH))
            name.append(g)
            findAndInsert(name, givenName: givenName, idx: 1)
        }
        
    }
    
    func findAndInsert(name: [Hanja], givenName: String, idx : Int) {
        
        if (idx == givenName.characters.count) {
            insertNewObject(name)
            return
        }
        
        var gname: [Hanja] = [Hanja]()
        let index = givenName.startIndex.advancedBy(idx)
        gname = getHanjaDataFromHangul(String(givenName[index]))
        
        for g in gname {
            var n = name
            n.append(g)
            findAndInsert(n, givenName: givenName, idx: idx + 1)
        }

    }
    
    func insertNewObject(name: [Hanja]) {
        // at most one given name
        if name.count < 2 {
            return
        }
        
        // filter out all even number or all odd number hanja
        let k = name[0].2 % 2
        var count = 0
        for n in name {
            if ((n.2 % 2) == k) {
                count++
            }
        }
        if count == name.count {
            return
        }
        
        // add name
        let elem = Elem(name: name)
        objects.insert(elem, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let object = objects[indexPath.row] as! Elem
        cell.textLabel!.text = object.desc()
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let obj = objects[indexPath.row] as! Elem
                let controller = segue.destinationViewController as! DetailViewController
                controller.detailItem = obj
            }
        }
    }
}

