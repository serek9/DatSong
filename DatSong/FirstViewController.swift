//
//  FirstViewController.swift
//  DatSong
//
//  Created by DAM on 9/2/17.
//  Copyright © 2017 SergioD. All rights reserved.
//

import UIKit
var list = ["Tame Impala", "The Black Angels", "Pond", "Melody's Echo Chamber"]

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
//    var list = ["Tame Impala", "The Black Angels", "Pond", "Melody's Echo Chamber"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (list.count)
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete{
            list.removeAtIndex(indexPath.row)
            myTableView.reloadData()
            //TODO -- 7:45 (https://www.youtube.com/watch?v=LrCqXmHenJY)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

