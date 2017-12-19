//
//  Pessoa+CoreDataProperties.m
//  Core Data Stack
//
//  Created by Cast Group on 18/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
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
