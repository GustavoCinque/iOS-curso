//
//  XMLCarroParser.h
//  Carros Aula
//
//  Created by C1284047 (Edi Vergis) on 28/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Carro;
@interface XMLCarroParser : NSObject<NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray<Carro*> *carros;

@end
