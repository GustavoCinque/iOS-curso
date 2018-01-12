//
//  SoundUtil.h
//  multimidia
//
//  Created by Cast Group on 09/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundUtil : NSObject <AVAudioPlayerDelegate>

- (void) playFile:(NSString*) arquivo;
- (void) playUrl:(NSURL*) url;
- (void) pause;
- (void) stop;

@end
