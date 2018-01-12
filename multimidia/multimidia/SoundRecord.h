//
//  SoundRecord.h
//  multimidia
//
//  Created by Cast Group on 09/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundRecord : NSObject<AVAudioRecorderDelegate>

- (void) start:(NSURL*)url;
- (void) stop;

@end
