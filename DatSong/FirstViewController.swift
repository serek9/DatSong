//
//  FirstViewController.swift
//  DatSong
//
//  Created by DAM on 9/2/17.
//  Copyright © 2017 SergioD. All rights reserved.
//

import UIKit
import CoreData

var list:[NSManagedObject] = []

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let query = NSFetchRequest(entityName: "Song")
        do{
            list = try context.executeFetchRequest(query) as! [NSManagedObject]
        }catch let error as NSError{
            print(error)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (list.count)
    }
    
    override func viewDidAppear(animated: Bool) {
        myTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row].valueForKeyPath("artistName"+" - "+"songName") as! String
        return(cell)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete{
            list.removeAtIndex(indexPath.row)
            myTableView.reloadData()
            
        }
    }
}


//VIDEO LISTAS -- (https://www.youtube.com/watch?v=LrCqXmHenJY)
//VIDEO COREDATA -- https://www.youtube.com/watch?v=WcQkBYu86h8

