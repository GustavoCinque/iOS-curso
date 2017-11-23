//
//  CGMensagem.h
//  Frases
//
//  Created by Cast Group on 23/11/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGMensagem : NSObject

@property (nonatomic, strong) NSString *mensagem;

- (instancetype) initComMensagem:(NSString*) mensagem;

@end
