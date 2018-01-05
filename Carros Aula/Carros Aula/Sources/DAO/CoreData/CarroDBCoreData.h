//
//  CarroDBCoreData.h
//  Carros
//
//  Created by Edi Vergis on 27/12/2017.
//  Copyright © 2017 Edi Vergis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Carros_Aula+CoreDataModel.h"

@interface CarroDBCoreData : NSObject
// Cria uma instância do Carro (inserindo no managed object context)
+ (CarroCD *) newInstance;
// Consulta os carros por tipo
- (NSMutableArray<CarroCD*> *) getCarrosTipo:(NSString *)tipo;
// Salva ou atualiza o carro
- (void) salvar:(CarroCD *)carro;
// Deleta todos os carros por tipo
- (void) deletarCarrosTipo:(NSString *)tipo;
// Deleta o carro
- (void) deletar:(CarroCD *)carro;

@end
