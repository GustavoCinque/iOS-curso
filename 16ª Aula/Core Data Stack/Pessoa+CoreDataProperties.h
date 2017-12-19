//
//  Pessoa+CoreDataProperties.h
//  Core Data Stack
//
//  Created by Cast Group on 18/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "Pessoa+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Pessoa (CoreDataProperties)

+ (NSFetchRequest<Pessoa *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dataNasc;
@property (nonatomic) int16_t idade;
@property (nullable, nonatomic, copy) NSString *nome;
@property (nullable, nonatomic, copy) NSString *sobrenome;

@end

NS_ASSUME_NONNULL_END
