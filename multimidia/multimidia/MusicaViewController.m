//
//  MusicaViewController.m
//  multimidia
//
//  Created by Cast Group on 09/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

#import "MusicaViewController.h"
#import "SoundUtil.h"
#import "SoundRecord.h"

@interface MusicaViewController ()

@property(nonnull, strong) SoundUtil *soundUtil;

@property(nonnull, strong) SoundRecord *soundRecord;

@end

@implementation MusicaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.soundUtil = [SoundUtil new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)tocarMusicaPlay:(id)sender {
    [self.soundUtil playFile:@"thai.mp3"];
}

- (IBAction)gravarMusicaStart:(id)sender {
    self.soundRecord = [SoundRecord new];
    [self.soundRecord start:[NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"record.caf"]]];
}

- (IBAction)pause:(id)sender {
    [self.soundUtil pause];
}

- (IBAction)stop:(id)sender {
    if(self.soundRecord) {
        [self.soundRecord stop];
        self.soundRecord = nil;
    }
    [self.soundUtil stop];
}
	
- (IBAction)playRecord:(id)sender {
    [self.soundUtil playFile:[NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"record.caf"]]];
}

@end
