//
//  CGTarefa.h
//  MinhasNotasDiarias
//
//  Created by Cast Group on 13/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CGTarefa : NSManagedObject

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSDate *data;

@end
