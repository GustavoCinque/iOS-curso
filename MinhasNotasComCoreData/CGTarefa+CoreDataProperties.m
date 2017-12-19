//
//  CGTarefa+CoreDataProperties.m
//  MinhasNotasComCoreData
//
//  Created by Cast Group on 19/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGTarefa+CoreDataProperties.h"

@implementation CGTarefa (CoreDataProperties)

+ (NSFetchRequest<CGTarefa *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CGTarefa"];
}

@dynamic nome;
@dynamic data;
@dynamic identificador;

@end
