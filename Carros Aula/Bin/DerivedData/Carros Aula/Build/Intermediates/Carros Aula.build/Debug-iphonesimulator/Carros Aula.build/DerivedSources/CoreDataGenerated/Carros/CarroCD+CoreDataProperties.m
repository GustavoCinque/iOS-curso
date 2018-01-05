//
//  CarroCD+CoreDataProperties.m
//  
//
//  Created by C1284047 (Edi Vergis) on 03/01/2018.
//
//  This file was automatically generated and should not be edited.
//

#import "CarroCD+CoreDataProperties.h"

@implementation CarroCD (CoreDataProperties)

+ (NSFetchRequest<CarroCD *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CarroCD"];
}

@dynamic desc;
@dynamic latitude;
@dynamic longitude;
@dynamic nome;
@dynamic timestamp;
@dynamic tipo;
@dynamic url_foto;
@dynamic url_info;
@dynamic url_video;

@end
