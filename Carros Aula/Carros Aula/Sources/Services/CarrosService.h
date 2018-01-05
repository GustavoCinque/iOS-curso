//
//  CarrosService.h
//  Carros Aula
//
//  Created by C1284047 (Edi Vergis) on 27/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, EnumTipoCarro) {
    EnumTipoCarroClassicos = 0,
    EnumTipoCarroEsportivos = 1,
    EnumTipoCarroLuxo = 2,
};

@class Carro;
@interface CarrosService : NSObject

@property (nonatomic, assign) void (^nomeBloco) (NSArray<Carro*>* listaCarros, NSError *error);

@property (nonatomic, strong) NSString * nome;

+ (NSArray<Carro*>*) getCarros;

+ (void) getCarrosPorTipo:(EnumTipoCarro)enumTipo

                    cache:(BOOL) cache

                    callback:(void (^) (NSArray<Carro*>* listaCarros, NSError *error) )callback;

@end














