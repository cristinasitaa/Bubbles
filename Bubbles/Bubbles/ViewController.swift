//
//  ViewController.swift
//  Bubbles
//
//  Created by Admin on 4/11/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var bubblesView: CSBubblesView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
  
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       self.bubblesView.dataArray = NSMutableArray(array: ["Argentina", "Aruba", "Australia", "Austria", "Bahamas", "Barbados",  "Belgium", "Belize",  "Bermuda",  "Brazil",  "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Dominican Republic", "Egypt", "Faroe Islands", "Fiji",  "France", "Germany", "Greece"])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

