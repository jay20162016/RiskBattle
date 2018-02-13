//
//  ViewController.swift
//  RiskBattle
//
//  Created by Jay Jayjay on 1/14/18.
//  Copyright © 2018 Jay Jayjay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var deftrps: UITextField!
    @IBOutlet weak var offtrps: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="battle"){
            (segue.destination as! BattleViewController).deftrps=deftrps.text!;
            (segue.destination as! BattleViewController).offtrps=offtrps.text!;
        }
    }
}

