//
//  Viagem+CoreDataProperties.m
//  Minhas Viagens
//
//  Created by Cast Group on 20/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "Viagem+CoreDataProperties.h"

@implementation Viagem (CoreDataProperties)

+ (NSFetchRequest<Viagem *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Viagem"];
}

@dynamic latitude;
@dynamic longitude;
@dynamic descricao;

@end
