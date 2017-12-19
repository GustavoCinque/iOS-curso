//
//  Pessoa+CoreDataProperties.m
//  
//
//  Created by C1284047 (Edi Vergis) on 14/12/2017.
//
//  This file was automatically generated and should not be edited.
//

#import "Pessoa+CoreDataProperties.h"

@implementation Pessoa (CoreDataProperties)

+ (NSFetchRequest<Pessoa *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Pessoa"];
}

@dynamic dataNascimento;
@dynamic idade;
@dynamic nome;
@dynamic sobrenome;

@end
