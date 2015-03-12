//
//  SlotLogic.swift
//  mySlots
//
//  Created by Fenkins on 02/03/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

import Foundation

class SlotLogic {
    
    class func runTroughRaws (slots:[[Slot]]) -> Int {
        var slotRowsToRun = decomposeThoseColomnsIntoRows(slots)
        
        var winnings:Int = 0
        var winsCount:Int = 0
        
        var eatableWinsCount:Int = 0
        var barWinsCount:Int = 0
        var bigWinsCount:Int = 0
        var sevenWinsCount:Int = 0
        
        for everyRow in slotRowsToRun {
            if checkEatable(everyRow) == true {
                println("Mm tasty")
                winnings += 1
                winsCount += 1
                eatableWinsCount += 1
            }
            else if checkBar(everyRow) == true {
                println("Wonna go for a drink, sailer?")
                winnings += 5
                winsCount += 1
                barWinsCount += 1
            }
            else if checkBigWin(everyRow) == true {
                println("NICE! Lucky you!")
                winnings += 10
                winsCount += 1
                bigWinsCount += 1
            }
            else if checkThoseSeven(everyRow) == true {
                println("Seven! Here you go")
                winnings += 7
                winsCount += 1
                sevenWinsCount += 1
            }
            if winsCount == 3 {
                println("Three in a Row, MAN!")
                winnings += 3
            } else if winsCount == 7 {
                println("Seven in a Row, DUDE!")
                winnings += 7
                winsCount = 0
            } else if eatableWinsCount == 3 {
                println("So much vegetables")
                winnings += 3
            } else if eatableWinsCount == 7 {
                println("Veggie overdose")
                winnings += 7
            } else if barWinsCount == 3 {
                println("Don't you have enough alread?!")
                winnings += 15
            } else if barWinsCount == 7 {
                println("Don't you have enough already?!")
                winnings += 35
            } else if bigWinsCount == 3 {
                println("I got something for ya")
                winnings += 30
            } else if bigWinsCount == 7 {
                println("How are you plannin do get home with all that money?!")
                winnings += 70
            } else if sevenWinsCount == 3 {
                println("Whatcha lucky number?")
                winnings += 21
            } else if sevenWinsCount == 7 {
                println("Lucky you")
                winnings += 49
            }
        }
        return winnings
    }
    
    class func decomposeThoseColomnsIntoRows (slots:[[Slot]]) -> [[Slot]] {
        var slotsRaw0:[Slot] = []
        var slotsRaw1:[Slot] = []
        var slotsRaw2:[Slot] = []
        var slotArray = slots
        for var index = 0; index < slotArray.count; ++index {
            switch index {
            case 0:
            slotsRaw0 = slotArray[index]
            case 1:
            slotsRaw1 = slotArray[index]
            case 2:
            slotsRaw2 = slotArray[index]
            default:
                println("Error")
            }
            }
        var outputArray = [slotsRaw0, slotsRaw1, slotsRaw2]
        return outputArray
    }
    
    class func checkEatable (slotRow:[Slot]) -> Bool {
        let slot0 = slotRow[0]
        let slot1 = slotRow[1]
        let slot2 = slotRow[2]
        
        if slot0.isFruit == true && slot1.isFruit == true && slot2.isFruit == true {
            return true
        }
        else {
            return false }
    }
    
    class func checkBar (slotRow:[Slot]) -> Bool {
        let slot0 = slotRow[0]
        let slot1 = slotRow[1]
        let slot2 = slotRow[2]
        
        if slot0.isBar == true && slot1.isBar == true && slot2.isBar == true {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkBigWin (slotRow:[Slot]) -> Bool {
        let slot0 = slotRow[0]
        let slot1 = slotRow[1]
        let slot2 = slotRow[2]
        
        if slot0.isBigWin == true && slot1.isBigWin == true && slot2.isBigWin == true {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThoseSeven (slotRow:[Slot]) -> Bool {
        let slot0 = slotRow[0]
        let slot1 = slotRow[1]
        let slot2 = slotRow[2]
        
        if slot0.isSeven == true && slot1.isSeven == true && slot2.isSeven == true {
            return true
        }
        else {
            return false
        }
    }
}