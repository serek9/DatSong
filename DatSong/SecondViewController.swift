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
    @IBOutlet weak var switchArtist: UISwitch!
    
    @IBAction func addButton(sender: AnyObject) {
        if switchArtist.on{
            if songInput.text != ""{
                list.append(songInput.text!)
                songInput.text = ""
            }
        }else{
            if songInput.text != "" && artistInput.text != ""{
                list.append(songInput.text!+" - "+artistInput.text!)
                songInput.text = ""
                artistInput.text = ""
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if switchArtist.on {
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

