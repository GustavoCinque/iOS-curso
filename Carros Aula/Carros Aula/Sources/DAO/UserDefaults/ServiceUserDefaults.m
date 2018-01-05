//
//  ServiceUserDefaults.m
//  Carros Aula
//
//  Created by Cast Group on 04/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import "ServiceUserDefaults.h"

@implementation ServiceUserDefaults

+(instancetype)sharedInstance {
    static ServiceUserDefaults *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ServiceUserDefaults new];
    });
    return sharedInstance;
}
- (NSUserDefaults*) defaults {
    return [NSUserDefaults standardUserDefaults];
}

- (void) setUltimoTipoSelecionado:(NSUInteger)ultimoTipoSelecionado {
    [[self defaults] setObject:@(ultimoTipoSelecionado) forKey:@"kTipoCarro"];
}

- (NSUInteger) ultimoTipoSelecionado {
    return [[[self defaults] objectForKey:@"kTipoCarro"] integerValue];
}

@end
