//
//  Carro.h
//  Carros Aula
//
//  Created by C1284047 (Edi Vergis) on 27/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONAPI.h"

@interface Carro : JSONModel

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *url_foto;
@property (nonatomic, strong) NSString *url_info;
@property (nonatomic, strong) NSString *url_video;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, retain) NSString<Optional> *tipo;

@end

@protocol Carro
@end

@interface Carros : JSONModel

@property (nonatomic, strong) NSMutableArray<Carro> *carro;

@end

@interface RootCarro : JSONModel

@property (nonatomic, strong) Carros *carros;

@end
