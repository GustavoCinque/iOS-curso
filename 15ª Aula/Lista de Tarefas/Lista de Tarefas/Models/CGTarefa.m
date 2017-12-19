//
//  CGTarefa.m
//  Lista de Tarefas
//
//  Created by C1284047 (Edi Vergis) on 14/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGTarefa.h"

@implementation CGTarefa


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        self.nome = [aDecoder decodeObjectForKey:@"nome"];
        self.data = [aDecoder decodeObjectForKey:@"data"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.nome forKey:@"nome"];
    [aCoder encodeObject:self.data forKey:@"data"];
    
}

- (BOOL)isEqual:(CGTarefa*)other
{
    BOOL ret = NO;
    if (other == self) {
        ret =  YES;
    } else {
        ret = ([self.nome isEqualToString:other.nome] && ([self.data compare:other.data] == NSOrderedSame));
    }
    
    return ret;
}


@end
