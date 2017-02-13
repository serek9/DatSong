//
//  SecondViewController.swift
//  DatSong
//
//  Created by DAM on 9/2/17.
//  Copyright © 2017 SergioD. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var songInput: UITextField!
    @IBOutlet weak var artistInput: UITextField!
    
    
    
    @IBAction func addButton(sender: AnyObject) {
        if songInput != ""{
            list.append()
            //TODO 12:36 -- (https://www.youtube.com/watch?v=LrCqXmHenJY)
        }
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

