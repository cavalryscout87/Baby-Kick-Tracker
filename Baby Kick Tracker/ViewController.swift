//
//  ViewController.swift
//  Baby Kick Tracker
//
//  Created by Patrick Lockett on 12/14/16.
//  Copyright © 2016 Patrick Lockett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var lblTimer: UILabel!
    
    @IBOutlet weak var lblCounter: UILabel!
    
    @IBOutlet weak var lblBibleVerse: UILabel!
    
    @IBOutlet weak var btnStartName: UIButton!
    
    @IBOutlet weak var btnStopName: UIButton!
    
    var intKickCounter = 0
    var strStartButtonLabel = "+1"
    var intTimer = [Timer]()
    var strBibleVerse = ""
    var intBibleRandomCounter = 0
    var intSeconds = 0
    var intHours = 0
    var boolTimerStarted = false
    var intArrayIndex = 0
    var strStopButtonLabel = ""
    var boolStopButtonPressed = false
    
    @IBAction func onStartButtonPressed(_ sender: UIButton) {
        upDateInformation()
        BibleVerseRandomizer()
        updateLabels()
    }
    
    @IBAction func onStopButtonPressed(_ sender: UIButton) {
        boolStopButtonPressed = true
        updateLabels()
        reset()
    }
    
    func upDateInformation(){
        intKickCounter += 1
        if boolTimerStarted == false{
            intTimer.append(Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true));
            boolTimerStarted = true
        }
        
    }
    func updateLabels(){
        lblCounter.text = "\(intKickCounter)"
        lblBibleVerse.text = strBibleVerse
        if intKickCounter > 0{
            strStartButtonLabel = "+1"
            btnStartName.setTitle(strStartButtonLabel, for: .normal)
        }else{
            strStartButtonLabel = "Start"
            btnStartName.setTitle(strStartButtonLabel, for: .normal)
            }
        if boolStopButtonPressed == true{
            strStopButtonLabel = "Clear"
            btnStopName.setTitle(strStopButtonLabel, for: .normal)
        }else{
            strStopButtonLabel = "Stop"
            btnStopName.setTitle(strStopButtonLabel, for: .normal)

        }
    }
    func reset(){
        strBibleVerse = "Do not be anxious about anything, but in everything, by prayer and petition, with thanksgiving, present your requests to God. And the peace of God, which transcends all understanding, will guard your hearts and minds in Christ Jesus. Philippians 4:6-7"
        if boolTimerStarted == true {
            intTimer[intArrayIndex].invalidate()
            intArrayIndex += 1
            boolTimerStarted = false
        }else{
            eraseAll()
            updateLabels()
            updateTimer()
        }
    }
    
    func eraseAll(){
        intKickCounter = 0
        intBibleRandomCounter = 0
        intSeconds = 0
        intHours = 0
        boolTimerStarted = false
        boolStopButtonPressed = false
    }
    
    func updateTimer(){
        //intSeconds += 1
        if intSeconds < 60{
            if intSeconds > 9 {
            lblTimer.text = "0\(intHours):\(intSeconds)"
            }else{
                lblTimer.text = "0\(intHours):0\(intSeconds)"
            }
        }else{
            intHours += 1
            intSeconds = 0
            if intSeconds > 9 {
                lblTimer.text = "0\(intHours):\(intSeconds)"
            }else{
                lblTimer.text = "0\(intHours):0\(intSeconds)"
            }
        }
        intSeconds += 1
    }
    
    func BibleVerseRandomizer(){
        
        if intKickCounter > 10{
        intBibleRandomCounter = intKickCounter - 10
        }else if intKickCounter > 20{
            intBibleRandomCounter = intKickCounter - 20
        }else if intKickCounter > 30{
                intBibleRandomCounter = intKickCounter - 30
        }else{
            intBibleRandomCounter = intKickCounter
        }
        
        switch intBibleRandomCounter {
        case 1:
            strBibleVerse = "Do not be anxious about anything, but in everything, by prayer and petition, with thanksgiving, present your requests to God. And the peace of God, which transcends all understanding, will guard your hearts and minds in Christ Jesus. Philippians 4:6-7"
        case 2:
            strBibleVerse = "Trust in the Lord with all your heart and lean not on your own understanding; in all your ways acknowledge him, and he will direct your paths. Proverbs 3:5-6"
        case 3:
            strBibleVerse = "My flesh and my heart may fail, but God is the strength of my heart and my portion forever.” Psalm 73:26"
        case 4:
            strBibleVerse = "The Lord is my strength and my shield; my heart trusts in him and he helps me.” Psalm 28:7"
        case 5:
            strBibleVerse = "But the wisdom that comes from heaven is first of all pure; then peace-loving, considerate, submissive, full of mercy and good fruit, impartial and sincere.” James 3:17"
        case 6:
            strBibleVerse = "He tends to his flock like a shepherd: he gathers the lambs in his arms and carries them close to his heart; he gently leads those who have young.” Isaiah 40:11"
        case 7:
            strBibleVerse = "And god is able to bless you abundantly, so that in all things at all times, having all that you need, you will abound in every good work.” 2 Corinthians 9:8"
        case 8:
            strBibleVerse = "Wisdom is the principle thing. Therefore, get wisdom. In all of your getting, get understanding.” Proverbs 4:7"
        case 9:
            strBibleVerse = "Her {wisdom’s} ways are pleasant ways, and all her paths are peace. She is a tree of life to those who take hold of her; those who hold her fast will be blessed.” Proverbs 3:17-18"
        case 10:
            strBibleVerse = "Such confidence as this is ours through Christ before God. Nat that we are competent in ourselves to claim anything for ourselves, but our competence comes from God.“ 2 Corinthians 3:4-5 "
            
        default:
            strBibleVerse = "Do not be anxious about anything, but in everything, by prayer and petition, with thanksgiving, present your requests to God. And the peace of God, which transcends all understanding, will guard your hearts and minds in Christ Jesus. Philippians 4:6-7"
        }
    }
}

