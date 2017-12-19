//
//  CGTarefa.h
//  Lista de Tarefas
//
//  Created by C1284047 (Edi Vergis) on 14/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGTarefa : NSObject<NSCoding>

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSDate *data;

@end
