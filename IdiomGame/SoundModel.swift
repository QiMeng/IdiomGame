//
//  SoundModel.swift
//  IdiomGame
//
//  Created by Lin.Pan on 7/28/15.
//  Copyright (c) 2015 QiMENG. All rights reserved.
//

import Foundation

class SoundModel: NSObject {
   
    dynamic var audioPlayerBack:AVAudioPlayer!
    var audioPlayerTouchBtn:AVAudioPlayer!
    func loadSoundBack(filename:NSString) {
        let url = NSBundle.mainBundle().URLForResource(filename as String, withExtension: "aiff")
        var error:NSError? = nil
 
        let session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayback, error: nil)
        session.setActive(true, error: nil)
        
        self.audioPlayerBack = AVAudioPlayer(contentsOfURL: url, error: &error)
        self.audioPlayerBack.prepareToPlay()
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

    }
    func soundBackPlay(playSound:Bool)
    {
        self.loadSoundBack("1")
        self.audioPlayerBack.numberOfLoops = -1
        if playSound
        {
            self.audioPlayerBack.play()
        }else
        {
            self.audioPlayerBack.stop()
        }
    }
    
    func soundTouchBtn()
    {
        self.loadSoundTouchBtn()
        self.audioPlayerTouchBtn.play()
    }
    
//    func soundRightIdiom(arightdiom:Bool)
//    {
//        if arightdiom
//        {
//            self.loadSound("2")
//            self.audioplayer.play()
//        }else
//        {
//            self.loadSound("2")
//            self.audioplayer.play()
//        }
//    }
    
}
