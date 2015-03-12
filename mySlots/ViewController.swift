//
//  ViewController.swift
//  mySlots
//
//  Created by Fenkins on 24/02/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // Containers
    var firstContainer, secondContainer, thirdContainer, fourthContainer:UIView!
    var labelsContainerTop, labelsContainerBottom:UIView!
    
    // Slot array
    var slots:[[Slot]] = []
    
    // Info Labels
    var winningsLabel, bankLabel, betLabel:UILabel!
    var winningsTitleLabel, bankTitleLabel, betTitleLabel:UILabel!
    
    // Credits
    var winnings:Int = 0
    var bank:Int = 0
    var currentBet:Int = 0
    
    // Buttons
    var resetButton, betOneButton, betMaxButton, spinButton:UIButton!
    
    // Constants
    let kMarginForView:CGFloat = 10.0
    let kMarginForSlot:CGFloat = 2.0
    
    let kSixth:CGFloat = 1.0/6.0
    let kOneThird:CGFloat = 1.0/3.0
    let kOneTwo:CGFloat = 1.0/2.0
    let kTwoThird:CGFloat = 2.0/3.0
    let kOneEight:CGFloat = 1.0/8.0
    let kOneSixTeen:CGFloat = 1.0/16.0
    
    let kNumberOfSlots = 3
    let kNumberOfSlotRows = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerViewBuilder()
        
        setupLabelsContainerTop(labelsContainerTop)
        setupLabelsContainerBottom(labelsContainerBottom)
        
        setupFourthContainer(fourthContainer)
        hardReset()
        setupLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // IBActions
    
    func resetButtonPressed(button: UIButton) {
        println("J")
        hardReset()
        setupLabels()
    }
    
    func betOneButtonPressed(button: UIButton) {
        if bank <= 0 {
            viewAlertOntheScreen(header: "Not enough money in the bank", message: "You may want to reset game")
        }
        else {
        if currentBet < 5 {
            bank -= 1
            currentBet += 1
            }
        else {
            viewAlertOntheScreen(header: "You cant bet more then 5", message: "Spin the cylinder already")
            }
        }
        
        setupLabels()
        
    }
    
    func betMaxButtonPressed(button: UIButton) {
        if bank <= 0 {
            viewAlertOntheScreen(header: "Not enough money in the bank", message: "You may want to reset the game")
        }
        else {
            if currentBet == 5 {
                viewAlertOntheScreen(header: "You cant bet more then 5", message: "Sorry man")
            }
            else {
                if bank + currentBet >= 5 {
                    bank += (currentBet - 5)
                    currentBet = 5
                }
            }
        }
        
        setupLabels()
        
    }
    
    func spinButtonPressed(button: UIButton) {
        removeViewFromSubview()
        println("G")
        slots = Factory.createSlotArray()
        setupFirstContainer(self.firstContainer)
        var winningsMultiplyer = SlotLogic.runTroughRaws(slots)
        winnings = currentBet * winningsMultiplyer
        bank += winnings
        currentBet = 0
        setupLabels()

    }


    func containerViewBuilder () {
    self.firstContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, self.view.bounds.origin.y + kMarginForView, self.view.bounds.width * kOneTwo - kMarginForView, self.view.bounds.height - (kMarginForView * 2)))
    self.firstContainer.backgroundColor = UIColor.darkGrayColor()
        self.view.addSubview(self.firstContainer)
        
    self.secondContainer = UIView(frame: CGRectMake(firstContainer.frame.width + kMarginForView, self.view.bounds.origin.y + kMarginForView, self.view.bounds.width * kOneTwo - kMarginForView, self.view.bounds.height - (kMarginForView * 2)))
        self.secondContainer.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(secondContainer)
    self.thirdContainer = UIView(frame: CGRectMake(secondContainer.frame.origin.x, secondContainer.frame.origin.y + kMarginForView * kOneTwo, secondContainer.bounds.width, secondContainer.bounds.height * kOneTwo - kMarginForView * kOneTwo))
        self.thirdContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(thirdContainer)
    self.fourthContainer = UIView(frame: CGRectMake(secondContainer.frame.origin.x, thirdContainer.bounds.height + kMarginForView * 2, secondContainer.bounds.width, secondContainer.bounds.height * kOneTwo - kMarginForView))
        self.fourthContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(fourthContainer)
    self.labelsContainerTop = UIView(frame: CGRectMake(thirdContainer.frame.origin.x, thirdContainer.bounds.origin.y + kMarginForView * 2, thirdContainer.bounds.width, thirdContainer.bounds.height * kOneTwo - kMarginForView))
        self.labelsContainerTop.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(labelsContainerTop)
    self.labelsContainerBottom = UIView(frame: CGRectMake(thirdContainer.frame.origin.x, labelsContainerTop.frame.height + kMarginForView * 3, thirdContainer.bounds.width, labelsContainerTop.bounds.height))
        self.labelsContainerBottom.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(labelsContainerBottom)
        
    }
    
    // All of our slots builded here
    func setupFirstContainer (containerView:UIView) {
        for var slotsNumber = 0; slotsNumber < kNumberOfSlots; ++slotsNumber {
            for var slotRowsNumber = 0; slotRowsNumber < kNumberOfSlotRows; ++slotRowsNumber {
                
                
                var slot:Slot
                
                var slotImageView = UIImageView()
                
                if slots.count != 0 {
                    let slotImageEx = slots[slotsNumber]
                    slot = slotImageEx[slotRowsNumber]
                    slotImageView.image = slot.image
                }
                else {
                slotImageView.image = UIImage(named: "banana")
                }
                slotImageView.frame = CGRectMake(containerView.bounds.origin.x + (containerView.frame.width * CGFloat(slotsNumber) * kOneThird) + kMarginForSlot, containerView.bounds.origin.y + (containerView.frame.height * CGFloat(slotRowsNumber) * kOneThird) + kMarginForSlot, containerView.frame.width * kOneThird - 2 * kMarginForSlot, containerView.frame.height * kOneThird - 2 * kMarginForSlot)
                
                // так нормально отрисовывается но не удаляется
                
//                self.view.addSubview(slotImageView)
                
                // так хуёво отрисовывается, но удаляется
                
                containerView.addSubview(slotImageView)

            }
        }
    }
    
    func setupLabelsContainerTop (containerView:UIView) {
        self.bankLabel = UILabel()
        self.bankLabel.text = "00"
        self.bankLabel.textColor = UIColor.whiteColor()
        self.bankLabel.font = UIFont(name: "Avenir", size: 16)
        self.bankLabel.sizeToFit()
        self.bankLabel.center = CGPointMake(containerView.bounds.width * kSixth * 3, containerView.bounds.height * kTwoThird)
        self.bankLabel.textAlignment = NSTextAlignment.Center
        self.bankLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.bankLabel)
        
        self.betLabel = UILabel()
        self.betLabel.text = "00"
        self.betLabel.textColor = UIColor.whiteColor()
        self.betLabel.font = UIFont(name: "Avenir", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPointMake(containerView.bounds.width * kSixth * 5, containerView.bounds.height * kTwoThird)
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.betLabel)
        
        self.winningsLabel = UILabel()
        self.winningsLabel.text = "00"
        self.winningsLabel.textColor = UIColor.whiteColor()
        self.winningsLabel.font = UIFont(name: "Avenir", size: 16)
        self.winningsLabel.sizeToFit()
        self.winningsLabel.center = CGPointMake(containerView.bounds.width * kSixth, containerView.bounds.height * kTwoThird)
        self.winningsLabel.textAlignment = NSTextAlignment.Center
        self.winningsLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.winningsLabel)
    }
    func setupLabelsContainerBottom (containerView:UIView) {
        self.winningsTitleLabel = UILabel()
        self.winningsTitleLabel.text = "Winnings"
        self.winningsTitleLabel.textColor = UIColor.whiteColor()
        self.winningsTitleLabel.font = UIFont(name: "Avenir", size: 18)
        self.winningsTitleLabel.sizeToFit()
        self.winningsTitleLabel.center = CGPointMake(containerView.bounds.width * kSixth, containerView.bounds.height * kOneThird)
        self.winningsTitleLabel.textAlignment = NSTextAlignment.Center
        self.winningsTitleLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.winningsTitleLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Current Bet"
        self.betTitleLabel.textColor = UIColor.whiteColor()
        self.betTitleLabel.font = UIFont(name: "Avenir", size: 18)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPointMake(containerView.bounds.width * kOneSixTeen * 13, containerView.bounds.height * kOneThird)
        self.betTitleLabel.textAlignment = NSTextAlignment.Center
        self.betTitleLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.betTitleLabel)
        
        self.bankTitleLabel = UILabel()
        self.bankTitleLabel.text = "Bank"
        self.bankTitleLabel.textColor = UIColor.whiteColor()
        self.bankTitleLabel.font = UIFont(name: "Avenir", size: 20)
        self.bankTitleLabel.sizeToFit()
        self.bankTitleLabel.center = CGPointMake(containerView.bounds.width * kSixth * 3, containerView.bounds.height * kOneThird)
        self.bankTitleLabel.textAlignment = NSTextAlignment.Center
        self.bankTitleLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.bankTitleLabel)
    }
    func setupFourthContainer (containerView:UIView) {
        self.resetButton = UIButton()
        self.resetButton.setTitle("Reset", forState: UIControlState.Normal)
        self.resetButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Avenir", size: 18)
        self.resetButton.backgroundColor = UIColor.darkGrayColor()
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPointMake(containerView.bounds.width * kOneEight, containerView.bounds.height * kOneTwo)
        self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(resetButton)
        
        self.betOneButton = UIButton()
        self.betOneButton.setTitle("Bet one", forState: UIControlState.Normal)
        self.betOneButton.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        self.betOneButton.titleLabel?.font = UIFont(name: "Avenir", size: 18)
        self.betOneButton.backgroundColor = UIColor.grayColor()
        self.betOneButton.sizeToFit()
        self.betOneButton.center = CGPointMake(containerView.bounds.width * 3 * kOneEight, containerView.bounds.height * kOneTwo)
        self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(betOneButton)
        
        self.betMaxButton = UIButton()
        self.betMaxButton.setTitle("Bet five", forState: UIControlState.Normal)
        self.betMaxButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.betMaxButton.titleLabel?.font = UIFont(name: "Avenir", size: 18)
        self.betMaxButton.sizeToFit()
        self.betMaxButton.center = CGPointMake(containerView.bounds.width * 5 * kOneEight, containerView.bounds.height * kOneTwo)
        self.betMaxButton.backgroundColor = UIColor.grayColor()
        self.betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(betMaxButton)
        
        self.spinButton = UIButton()
        self.spinButton.setTitle("Spin", forState: UIControlState.Normal)
        self.spinButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.spinButton.titleLabel?.font = UIFont(name: "Avenir", size: 22)
        self.spinButton.sizeToFit()
        self.spinButton.center = CGPointMake(containerView.bounds.width * 7 * kOneEight, containerView.bounds.height * kOneTwo)
        self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.spinButton.backgroundColor = UIColor.orangeColor()
        containerView.addSubview(spinButton)
    }
    
    func removeViewFromSubview () {
        if self.firstContainer != nil {
            let container:UIView? = self.firstContainer!
            
            var subViews:Array? = container!.subviews
//            if subViews != nil {
//                subViews?.removeAll(keepCapacity: true)
//            }
            // Почему -то в этот цикл не входит
            for view in subViews! {
                view.removeFromSuperview!()
            }
        }
    }
    func hardReset () {
        removeViewFromSubview()
        slots.removeAll(keepCapacity: true)
        self.setupFirstContainer(self.firstContainer)
        winnings = 0
        bank = 50
        currentBet = 0
    }
    func setupLabels () {
        self.winningsLabel.text = "\(winnings)"
        self.bankLabel.text = "\(bank)"
        self.betLabel.text = "\(currentBet)"
    }
    
    func viewAlertOntheScreen (header:String = "Alert", message:String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
}

