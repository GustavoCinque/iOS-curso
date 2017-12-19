//
//  Pessoa+CoreDataProperties.h
//  
//
//  Created by C1284047 (Edi Vergis) on 14/12/2017.
//
//  This file was automatically generated and should not be edited.
//

#import "Pessoa+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Pessoa (CoreDataProperties)

+ (NSFetchRequest<Pessoa *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dataNascimento;
@property (nonatomic) int16_t idade;
@property (nullable, nonatomic, copy) NSString *nome;
@property (nullable, nonatomic, copy) NSString *sobrenome;

@end

NS_ASSUME_NONNULL_END
