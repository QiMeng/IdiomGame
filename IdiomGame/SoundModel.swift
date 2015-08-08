//
//  SoundModel.swift
//  IdiomGame
//
//  Created by Lin.Pan on 7/28/15.
//  Copyright (c) 2015 QiMENG. All rights reserved.
//

import Foundation

class SoundModel: NSObject,AVAudioPlayerDelegate {
   
    var audioPlayerBack:AVAudioPlayer!
    var audioPlayerTouchBtn:AVAudioPlayer!
    var audioPlayerIdiom:AVAudioPlayer!
    
    var audioPlayerTouchBtnSound:Bool = true
    
    func loadSoundBack(filename:NSString) {
        let url = NSBundle.mainBundle().URLForResource(filename as String, withExtension: "aiff")
        var error:NSError? = nil
 
        let session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayback, error: nil)
        session.setActive(true, error: nil)
        
        self.audioPlayerBack = AVAudioPlayer(contentsOfURL: url, error: &error)
        self.audioPlayerBack.prepareToPlay()
        self.audioPlayerBack.volume = 5
    }
    func soundBackPlay(playSound:Bool)
    {
        self.audioPlayerTouchBtnSound = playSound
//        self.loadSoundBack("1")
//        self.audioPlayerBack.numberOfLoops = -1
//        if playSound
//        {
//            self.audioPlayerBack.play()
//        }else
//        {
//            self.audioPlayerBack.stop()
//        }
    }
    
    func loadSoundTouchBtn()
    {
        let url = NSBundle.mainBundle().URLForResource("2", withExtension: "aiff")
        var error:NSError? = nil
        
        let session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayback, error: nil)
        session.setActive(true, error: nil)
        
        self.audioPlayerTouchBtn = AVAudioPlayer(contentsOfURL: url, error: &error)
        self.audioPlayerTouchBtn.prepareToPlay()
        self.audioPlayerTouchBtn.delegate = self

    }
    func soundTouchBtn()
    {
        if self.audioPlayerTouchBtnSound
        {
            self.loadSoundTouchBtn()
            self.audioPlayerTouchBtn.play()

        }
    }
    

    
    func loadRightIdiom(arightIdiom:Bool)
    {
        let url = NSBundle.mainBundle().URLForResource("2", withExtension: "aiff")
        var error:NSError? = nil
        
        let session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayback, error: nil)
        session.setActive(true, error: nil)
        
        self.audioPlayerIdiom = AVAudioPlayer(contentsOfURL: url, error: &error)
        self.audioPlayerIdiom.prepareToPlay()
        self.audioPlayerTouchBtn.delegate = self
    }
    func soundRightIdiom(arightdiom:Bool)
    {
        if arightdiom
        {
            self.loadRightIdiom(true)
            self.audioPlayerIdiom.play()
        }else
        {
            self.loadRightIdiom(false)
            self.audioPlayerIdiom.play()
        }
    }
    //-----AVAudioPlayerDelegate
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool)
    {
//        if(player == self.audioPlayerBack && flag == true) {
//            NSLog("Playback finish." );
//        }

    }
    
}
