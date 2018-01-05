//
//  XMLCarroParser.m
//  Carros Aula
//
//  Created by C1284047 (Edi Vergis) on 28/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "XMLCarroParser.h"
#import "Carro.h"

@implementation XMLCarroParser{
    
    Carro *_carroTemp;
    NSMutableString *_tempString;
}


- (void)parser:(NSXMLParser *)parser didStartElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(nonnull NSDictionary<NSString *,NSString *> *)attributeDict{
    
    if ([elementName isEqualToString:@"carros"]) {
        // Tag <carros> encontrada, cria a lista de carros
        self.carros = [@[] mutableCopy];
    }else if ([elementName isEqualToString:@"carro"]){
        // Tag <carro> encontrada, cria um novo objeto carro
        _carroTemp = [Carro new];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName{
    
    if ([elementName isEqualToString:@"carros"]) {
        return;
    }
    
    if ([elementName isEqualToString:@"carro"]) {
        
        [self.carros addObject:_carroTemp];
        _carroTemp = nil;
    }else{
        // Se não é a tag <carro>, pode ser as tags <nome>, <desc> etc.
        // Copia os valores do XML para o objeto carro
        // Se existirem tags com o mesmo nome da @property do Carro, o valor será copiado
        if (_tempString != nil && _carroTemp != nil) {
            
            [_carroTemp setValue:_tempString forKey:elementName];
        }
        _tempString = nil;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    NSString *s = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if(!_tempString){
        _tempString = [NSMutableString new];
    }
    
    [_tempString appendString:s];

}

@end
















