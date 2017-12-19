//
//  AppDelegate.h
//  Core Data Stack
//
//  Created by C1284047 (Edi Vergis) on 15/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

