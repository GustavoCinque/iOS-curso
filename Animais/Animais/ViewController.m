//
//  ViewController.m
//  Animais
//
//  Created by Cast Group on 09/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

#import "ViewController.h"
#import "SoundUtil.h"

@interface ViewController ()

@property(nonatomic, strong) SoundUtil *soundUtil;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.soundUtil = [SoundUtil new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)somCao:(id)sender {
    [self.soundUtil playFile:@"cao.mp3"];
}

- (IBAction)somGato:(id)sender {
    [self.soundUtil playFile:@"gato.mp3"];
}

- (IBAction)somLeao:(id)sender {
    [self.soundUtil playFile:@"leao.mp3"];
}

- (IBAction)somMacaco:(id)sender {
    [self.soundUtil playFile:@"macaco.mp3"];
}

- (IBAction)somOvelha:(id)sender {
    [self.soundUtil playFile:@"ovelha.mp3"];
}

- (IBAction)somVaca:(id)sender {
    [self.soundUtil playFile:@"vaca.mp3"];
}

@end
