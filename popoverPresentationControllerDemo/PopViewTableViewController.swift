//
//  PopViewTableViewController.swift
//  popoverPresentationControllerDemo
//
//  Created by liaolj on 16/11/25.
//  Copyright © 2016年 liaolj. All rights reserved.
//

import UIKit

class PopViewTableViewController: UITableViewController {

    var identifier:String!
    weak var parent:ViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = "\(identifier) \(indexPath.row)"
        cell.textLabel?.textAlignment = .Center
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index = indexPath.row
        switch identifier {
        case "image":
            parent.changeImage(index)
        default:
            parent.changeColor(index)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
