//
//  VideoViewController.m
//  multimidia
//
//  Created by Cast Group on 09/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoUtil.h"

@interface VideoViewController ()

@property (weak, nonatomic) IBOutlet UIView *view;

@property(strong, nonatomic) VideoUtil *videoUtil;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.videoUtil = [VideoUtil new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
    [self.videoUtil playUrl:[NSURL URLWithString:@"http://www.livroiphone.com.br/carros/esportivos/ferrari_ff.mp4"] withView:self.view];
}

- (IBAction)pause:(id)sender {
    [_videoUtil pause];
}

- (IBAction)stop:(id)sender {
    [_videoUtil stop];
}


@end
