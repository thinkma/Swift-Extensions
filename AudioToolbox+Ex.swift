//
//  AudioToolbox+Ex.swift
//
//  Created by Augus on 7/10/16.
//  Copyright © 2016 iAugus. All rights reserved.
//

import Foundation
import AudioToolbox

class AudioToolBox: NSObject {
    
    static let shared = AudioToolBox()
    
    fileprivate var soundID: SystemSoundID = 0
    
    func playM4RWithName(_ name: String?, bundle: Bundle = Bundle.main) {
        playWithBundle(bundle, name: name, type: "m4r")
    }
    
    func playMP3WithName(_ name: String?, bundle: Bundle = Bundle.main) {
        playWithBundle(bundle, name: name, type: "mp3")
    }
    
    fileprivate func playWithBundle(_ bundle: Bundle, name: String?, type: String?) {
        guard let filePath = bundle.path(forResource: name, ofType: type) else { return }
        
        let url = URL(fileURLWithPath: filePath)
        
        AudioServicesCreateSystemSoundID(url as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
}
