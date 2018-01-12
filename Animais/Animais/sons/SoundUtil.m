//
//  SoundUtil.m
//  multimidia
//
//  Created by Cast Group on 09/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

#import "SoundUtil.h"

@implementation SoundUtil {
    AVAudioPlayer *_player;
}

- (void) playFile:(NSString*) arquivo{
    if(!_player) {
        NSString *path = [[NSBundle mainBundle] pathForResource:arquivo ofType:nil];
        NSURL *url =[NSURL fileURLWithPath:path];
        [self playUrl:url];
    } else {
        [_player play];
    }
}

- (void) playUrl:(NSURL*) url{
    if(!_player) {
        NSError *error;
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        [_player setVolume:1.0]; //Volume = 0.0 ˜ 1.0
        
        if(!error) {
            _player.delegate = self;
            [_player play];
        } else {
            NSLog(@"Erro playUrl, %@", error);
        }
        
    }
}

- (void) pause{
    [_player pause];
}

- (void) stop{
    [_player stop];
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"Fim da musica");
    _player = nil;
}

@end
