//
//  ServiceUserDefaults.h
//  Carros Aula
//
//  Created by Cast Group on 04/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceUserDefaults : NSObject

+ (instancetype) sharedInstance;

@property(nonatomic, assign) NSUInteger ultimoTipoSelecionado;

@end
