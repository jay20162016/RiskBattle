//
//  BattleViewController.swift
//  RiskBattle
//
//  Created by Jay Jayjay on 1/14/18.
//  Copyright © 2018 Jay Jayjay. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {
    
    public var offtrps:String = ""
    public var deftrps:String = ""
    
    @IBOutlet weak var offtpb: UITextField!
    @IBOutlet weak var deftpb: UITextField!
    
    @IBOutlet weak var offdeft: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    let btl=Battle();

    @IBAction func onBattle(_ sender: Any) {
        var i=btl.riskBattle(NumberFormatter().number(from: offtrps) as! Int,NumberFormatter().number(from: offtpb.text!) as! Int,NumberFormatter().number(from: deftrps) as! Int,NumberFormatter().number(from: deftpb.text!) as! Int)
        
        //offdeft.text!="off. troops: " + ((i.index(of: 1) as Any) as! String) + ",def. troops " + ((i.index(of: 0) as Any) as! String)
        offdeft.text!="off. troops: " + String(i[1]) + " def. troops: " + String(i[0])
        offtrps=String(i[1])
        deftrps=String(i[0])
        print(i)
    }
    
    @IBAction func onCBattle(_ sender: Any) {
        var i=btl.riskCBattle(NumberFormatter().number(from: offtrps) as! Int,NumberFormatter().number(from: offtpb.text!) as! Int,NumberFormatter().number(from: deftrps) as! Int,NumberFormatter().number(from: deftpb.text!) as! Int)
        
        //offdeft.text!="off. troops: " + ((i.index(of: 1) as Any) as! String) + ",def. troops " + ((i.index(of: 0) as Any) as! String)
        offdeft.text!="off. troops: " + String(i[1]) + " def. troops: " + String(i[0])
        print("displaying")
        offtrps=String(i[1])
        deftrps=String(i[0])
        print(i)
    }

}

