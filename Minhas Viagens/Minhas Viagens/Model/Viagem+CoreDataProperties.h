//
//  Viagem+CoreDataProperties.h
//  Minhas Viagens
//
//  Created by Cast Group on 20/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "Viagem+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Viagem (CoreDataProperties)

+ (NSFetchRequest<Viagem *> *)fetchRequest;

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nullable, nonatomic, copy) NSString *descricao;

@end

NS_ASSUME_NONNULL_END
