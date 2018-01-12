//
//  VideoUtil.m
//  multimidia
//
//  Created by Cast Group on 09/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

#import "VideoUtil.h"

@implementation VideoUtil {
    MPMoviePlayerController *_playerController;
    
    MPMoviePlayerViewController *_playerViewController;
}

- (void) playFile:(NSString*) file withView:(UIView*) view {
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:nil];
    if(path) {
        NSURL *url =[NSURL fileURLWithPath:path];
        [self playUrl:url withView:view];
    }
}

- (void) playUrl:(NSURL*) url withView:(UIView*) view {
    @try {
        if(!_playerController) {
            _playerController = [[MPMoviePlayerController alloc] initWithContentURL:url];
        }
        [_playerController prepareToPlay];
        [_playerController.view setFrame: view.bounds];
        [view addSubview:_playerController.view];
    } @catch (NSException *exception) {
        NSLog(@"Error no try catch do [ViewUtil playUrl]");
    }
    
}

- (void) playFileAtFullScreen:(NSString*) file withController:(UIViewController*) viewController {
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:nil];
    if(path) {
        NSURL *url =[NSURL fileURLWithPath:path];
        [self playUrlAtFullScreen:url withController:viewController];
    }
}

- (void) playUrlAtFullScreen:(NSURL*) url withController:(UIViewController*) viewController {
    @try {
        if(!_playerViewController) {
            _playerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
        }
        [viewController presentMoviePlayerViewControllerAnimated:_playerViewController];
    } @catch (NSException *exception) {
        NSLog(@"Error no try catch do [ViewUtil playUrl]");
    }
}

- (void) stop {
    [_playerController pause];
}

- (void) pause {
    [_playerController pause];
}

@end
