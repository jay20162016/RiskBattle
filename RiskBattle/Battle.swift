//
//  Battle.swift
//  RiskBattle
//
//  Created by Jay Jayjay on 1/14/18.
//  Copyright © 2018 Jay Jayjay. All rights reserved.
//

import Foundation

class Battle{
    func rolladice() -> Int {
        return Int(arc4random_uniform(6))+1
    }


    func offwon(_ d1:Int,_ d2:Int,_ d3:Int,_ dd1:Int,_ dd2:Int,_ dtb:Int,_ otb:Int) ->  [Bool]{
        if (dtb == 1 && otb == 1){
            return [d1>dd1]
        }
        if (dtb == 1 && otb == 2){
            return [max(d1,d2)>dd1]
        }
        if (dtb == 1 && otb == 3){
            return [max(d1,d2,d3)>dd1]
        }
        if (dtb == 2 && otb == 1){
            return [d1>max(dd1,dd2)]
        }
        if (dtb == 2 && otb == 2){
            return [max(d1,d2)>max(dd1,dd2),min(d1,d2)>min(dd1,dd2)]
        }
        if (dtb == 2 && otb == 3){
            let i = max(d1,d2,d3)
            var l = [d1,d2,d3].sorted()
            return [i>max(dd1,dd2),l[1]>min(dd1,dd2)]
        }
        return [false]
    }

    let max_off = 3
    let max_def = 2
    func riskBattle(_ offtps
        :Int,_ offtb:Int,_ deftps:Int,_ deftb:Int) -> [Int] {
        let offtpb = offtb
        var offtrps=offtps
        let deftpb=deftb
        var deftrps=deftps
        
        if (offtrps==0 || offtpb <= 0){
            print("defence won, left=", deftrps)
            return [deftrps,offtrps]
        }
        if (deftrps==0 || deftpb <= 0){
            print("offence won, left=", offtrps)
            return [deftrps,offtrps]
        }
        if (deftpb>min(deftrps,max_def) || offtpb>min(offtrps, max_off)){
            return [deftrps,offtrps]
        }
        let dice1=rolladice()
        let dice2=rolladice()
        let dice3=rolladice()
        let diced1=rolladice()
        let diced2=rolladice()
        print("offdice: ",dice1," ",dice2," ",dice3," defdice: ",diced1," ",diced2," offtrps ",offtrps," deftrps ",deftrps," offtpb ",offtpb," deftpb ",deftpb)
        let wins:[Bool] = offwon(dice1,dice2,dice3,diced1,diced2,deftpb,offtpb)
        for i in wins{
            if (i){
                //defence loses
                deftrps=deftrps-1
            }
            else{
                //offence loses
                offtrps=offtrps-1
            }
        }
        return [deftrps,offtrps]
    }
    
    func riskCBattle(_ offtps
        :Int,_ offtb:Int,_ deftps:Int,_ deftb:Int) -> [Int] {
        var offtrps=offtps
        var deftrps=deftps
        var offtpb = 0
        var deftpb = 0
        
        while (true) {
            offtpb = min(offtb,offtps,max_off)
            deftpb = min(deftb,deftps,max_def)
        

            if (offtrps==0 || offtpb <= 0){
                print("defence won, left=", deftrps)
                return [deftrps,offtrps]
            }
            if (deftrps==0 || deftpb <= 0){
                print("offence won, left=", offtrps)
                return [deftrps,offtrps]
            }
            if (deftpb>min(deftrps,max_def) || offtpb>min(offtrps, max_off)){
                print("continue")
                break
                //continue
            }
            let dice1=rolladice()
            let dice2=rolladice()
            let dice3=rolladice()
            let diced1=rolladice()
            let diced2=rolladice()
            print("offdice: ",dice1," ",dice2," ",dice3," defdice: ",diced1," ",diced2," offtrps ",offtrps," deftrps ",deftrps," offtpb ",offtpb," deftpb ",deftpb)
            let wins:[Bool] = offwon(dice1,dice2,dice3,diced1   ,diced2,deftpb,offtpb)
            for i in wins{
                if (i){
                    //defence loses
                    deftrps=deftrps-1
                }
                else{
                    //offence loses
                    offtrps=offtrps-1
                }
            }
        }
        return [deftrps,offtrps]
    }
}
