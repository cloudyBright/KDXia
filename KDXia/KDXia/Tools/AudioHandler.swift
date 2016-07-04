//
//  RecordHandler.swift
//  KDXia
//
//  Created by cloudyBright on 16/6/27.
//  Copyright © 2016年 ky. All rights reserved.
//

import UIKit
import AVFoundation


class AudioHandler: NSObject {

    var _audioRecorder:AVAudioRecorder!
    
    //定义音频的编码参数，决定录制音频文件的格式，音质，容量大小等，建议采用AAC的编码方式
    
    let recordSettings = [AVSampleRateKey : NSNumber(float: Float(44100.0)),
                          AVFormatIDKey: NSNumber(int: Int32(kAudioFormatMPEG4AAC)),
                          AVNumberOfChannelsKey : NSNumber(int: 1),
                          AVEncoderAudioQualityKey : NSNumber(int: Int32(AVAudioQuality.Medium.rawValue))]
    
     init(cid:String) {
        
        super.init()
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try _audioRecorder = AVAudioRecorder(URL: AudioHandler.directoryURL(cid)!, settings: recordSettings)
            
            _audioRecorder.prepareToRecord() //准备录音
        } catch {
            
        }
    }
    
    
    func startRecord() {
        if !_audioRecorder.recording {
            let audioSession = AVAudioSession.sharedInstance()
            
            do {
                try audioSession.setActive(true)
                _audioRecorder.record()
                print("record!")
                
            } catch {
                
            }
        }
    }
    
    
    func stopRecord() {
        _audioRecorder.stop()
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setActive(false)
            print("stop!!")
        } catch {
            
        }
        
    }
    
    
    class func directoryURL(cid:String) -> NSURL? {
        
        let fileManager = NSFileManager.defaultManager()
        let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = urls[0] as NSURL
        
        let soundURL = documentDirectory.URLByAppendingPathComponent("\(cid).caf")
        
        return soundURL
    }
    
    class func startPlaying(cid:String) {
        do {
            let audioPlayer = try AVAudioPlayer(contentsOfURL: AudioHandler.directoryURL(cid)!)
            audioPlayer.play()
            print("play!!")
        } catch {
            
        }
    }
    
    
}














