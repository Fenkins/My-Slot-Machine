//
//  Factory.swift
//  mySlots
//
//  Created by Fenkins on 02/03/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

import Foundation
import UIKit

class Factory {
    class func createSlotArray () -> [[Slot]] {
        let numberOfSlotsRowArray = 3
        let numberOfSlotsArray = 3
        var slotRowArray:[[Slot]] = []
        for var zeroSlotsRow = 0; zeroSlotsRow < numberOfSlotsRowArray; ++zeroSlotsRow {
            var slotArray:[Slot] = []
            for var zeroSlots = 0; zeroSlots < numberOfSlotsArray; ++zeroSlots {
                // This line of code is replaced with Factory.createCustomSlot func
                //                var oneSlot = Slot(value: 1, image: UIImage(named: "lemon"), isFruit: true, isBigWin: false, isBar: false, isSeven: false)
                var oneSlot = Factory.createCustomSlot(slotArray)
                slotArray.append(oneSlot)
            }
            slotRowArray.append(slotArray)
        }
        return slotRowArray
    }
    
    class func createCustomSlot(customSlot:[Slot]) -> Slot {
        var valueNumber:[Int] = []
        for everySlot in customSlot {
        valueNumber.append(everySlot.value)
        }
        var slot:Slot
        var randomNumber = Int(arc4random_uniform(UInt32(10)))
        while contains(valueNumber, randomNumber) {
            randomNumber = Int(arc4random_uniform(UInt32(10)))
            //  I don't have an idea why the F am I write that line of code
            //            valueNumber.append(randomNumber)
            }
                switch randomNumber {
                            case 1:
                            slot = Slot(value: 1, image: UIImage(named: "7"), isFruit: false, isBigWin: false, isBar: false, isSeven: true)
                            case 2:
                            slot = Slot(value: 2, image: UIImage(named: "banana"), isFruit: true, isBigWin: false, isBar: false, isSeven: false)
                            case 3:
                            slot = Slot(value: 3, image: UIImage(named: "bar"), isFruit: false, isBigWin: false, isBar: true, isSeven: false)
                            case 4:
                            slot = Slot(value: 4, image: UIImage(named: "bigwin"), isFruit: false, isBigWin: true, isBar: false, isSeven: false)
                            case 5:
                            slot = Slot(value: 5, image: UIImage(named: "cherry"), isFruit: true, isBigWin: false, isBar: false, isSeven: false)
                            case 6:
                            slot = Slot(value: 6, image: UIImage(named: "lemon"), isFruit: true, isBigWin: false, isBar: false, isSeven: false)
                            case 7:
                            slot = Slot(value: 7, image: UIImage(named: "orange"), isFruit: true, isBigWin: false, isBar: false, isSeven: false)
                            case 8:
                            slot = Slot(value: 8, image: UIImage(named: "plum"), isFruit: true, isBigWin: false, isBar: false, isSeven: false)
                            case 9:
                            slot = Slot(value: 9, image: UIImage(named: "watermelon"), isFruit: true, isBigWin: false, isBar: false, isSeven: false)
                            default:
                            slot = Slot(value: 0, image: UIImage(named: "7"), isFruit: false, isBigWin: false, isBar: false, isSeven: true)
                                    }
        return slot
    }
}
