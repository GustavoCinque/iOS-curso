//
//  Pessoa+CoreDataProperties.m
//  
//
//  Created by C1284047 (Edi Vergis) on 15/12/2017.
//
//  This file was automatically generated and should not be edited.
//

#import "Pessoa+CoreDataProperties.h"

@implementation Pessoa (CoreDataProperties)

+ (NSFetchRequest<Pessoa *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Pessoa"];
}

@dynamic dataNasc;
@dynamic idade;
@dynamic nome;
@dynamic sobrenome;

@end
