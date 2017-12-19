//
//  CGTarefa+CoreDataProperties.h
//  MinhasNotasComCoreData
//
//  Created by Cast Group on 19/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGTarefa+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CGTarefa (CoreDataProperties)

+ (NSFetchRequest<CGTarefa *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *nome;
@property (nullable, nonatomic, copy) NSDate *data;
@property (nonatomic) int16_t identificador;

@end

NS_ASSUME_NONNULL_END
