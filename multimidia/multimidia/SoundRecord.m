//
//  SoundRecord.m
//  multimidia
//
//  Created by Cast Group on 09/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

#import "SoundRecord.h"

@implementation SoundRecord {
    AVAudioRecorder *_audioRecorder;
}

-(void) start:(NSURL *)url {
    NSError *error;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:YES error:&error];
    
    if(!error) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
        _audioRecorder = [[AVAudioRecorder alloc] initWithURL:url settings:@{} error:nil];
        _audioRecorder.delegate = self;
        [_audioRecorder prepareToRecord];
    } else {
        NSLog(@"%@", error.localizedDescription);
    }
}

-(void)stop {
    [_audioRecorder stop];
    [[AVAudioSession sharedInstance] setActive:NO error:nil];
}

-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
}

@end
