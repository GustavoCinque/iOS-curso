//
//  VideoUtil.h
//  multimidia
//
//  Created by Cast Group on 09/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoUtil : NSObject

- (void) playFile:(NSString*) file withView:(UIView*) view;
- (void) playUrl:(NSURL*) url withView:(UIView*) view;
- (void) playFileAtFullScreen:(NSString*) file withController:(UIViewController*) viewController;
- (void) playUrlAtFullScreen:(NSURL*) url withController:(UIViewController*) viewController;
- (void) stop;
- (void) pause;

@end
