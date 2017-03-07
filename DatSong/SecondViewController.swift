//
//  SecondViewController.swift
//  DatSong
//
//  Created by DAM on 9/2/17.
//  Copyright © 2017 SergioD. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {

    @IBOutlet weak var songInput: UITextField!
    @IBOutlet weak var artistInput: UITextField!
    @IBOutlet weak var switchArtist: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addButton(sender: AnyObject) {
        if switchArtist.on{
            if songInput.text != ""{
                let appDel = UIApplication.sharedApplication().delegate as! DataController
                let context: NSManagedObjectContext = appDel.managedObjectContext
                let entity = NSEntityDescription.entityForName("Song", inManagedObjectContext: context)
                let object = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
                object.setValue(songInput.text, forKey: "songName")
                do{
                    try context.save()
                    list.append(object)
                    self.navigationController?.popViewControllerAnimated(true)
                }catch let error as NSError{
                    print(error)
                }
                songInput.text = ""
            }
        }else{
            if songInput.text != "" && artistInput.text != ""{
                let appDel = UIApplication.sharedApplication().delegate as! DataController
                let context: NSManagedObjectContext = appDel.managedObjectContext
                let entity = NSEntityDescription.entityForName("Song", inManagedObjectContext: context)
                let object = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
                object.setValue(artistInput.text, forKey: "artistName")
                object.setValue(songInput.text, forKey: "songName")
                do{
                    try context.save()
                    list.append(object)
                    self.navigationController?.popViewControllerAnimated(true)
                }catch let error as NSError{
                    print(error)
                }
                songInput.text = ""
                artistInput.text = ""
            }
        }
    }
    
    
    
}

