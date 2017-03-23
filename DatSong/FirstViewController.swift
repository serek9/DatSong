//
//  FirstViewController.swift
//  DatSong
//
//  Created by DAM on 9/2/17.
//  Copyright © 2017 SergioD. All rights reserved.
//

import UIKit
import CoreData
import SafariServices

var list:[NSManagedObject] = []


class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var url: NSURL = NSURL(string: "")!
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
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row].valueForKeyPath("songName") as! String
        cell.detailTextLabel?.text = list[indexPath.row].valueForKeyPath("artistName") as! String
        print(list[indexPath.row].valueForKeyPath("artistName"))
        let song = list[indexPath.row].valueForKeyPath("songName") as! String
        let artist = list[indexPath.row].valueForKeyPath("artistName") as! String
        let total = "https://www.youtube.com/results?search_query=\(song)+\(artist)"
        //TODO
        //let newTotal = total.replacingOccurrences(of: " ", with: "+")
        //let newString = total.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        let url = NSURL(string: total)
        print(url)
        //https://www.youtube.com/results?search_query=little+wing+jimi+hendrix
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete{
            list.removeAtIndex(indexPath.row)
            myTableView.reloadData()
            
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        //let selectedCell = list[indexPath.row]
        
        let safariVC = SFSafariViewController(URL: url)
        //safariVC.view.tintColor = appTintColor
        safariVC.delegate = self
        
        self.presentViewController(safariVC, animated: true, completion: nil)
    }
}

extension FirstViewController : SFSafariViewControllerDelegate{
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}


//VIDEO LISTAS -- (https://www.youtube.com/watch?v=LrCqXmHenJY)
//VIDEO COREDATA -- https://www.youtube.com/watch?v=WcQkBYu86h8
//VIDEO SAFARIVC -- https://www.youtube.com/watch?v=q71gsQ1Q3xs

