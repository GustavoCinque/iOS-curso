//
//  CarroCD+CoreDataProperties.h
//  
//
//  Created by C1284047 (Edi Vergis) on 03/01/2018.
//
//  This file was automatically generated and should not be edited.
//

#import "CarroCD+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CarroCD (CoreDataProperties)

+ (NSFetchRequest<CarroCD *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *latitude;
@property (nullable, nonatomic, copy) NSString *longitude;
@property (nullable, nonatomic, copy) NSString *nome;
@property (nullable, nonatomic, copy) NSDate *timestamp;
@property (nullable, nonatomic, copy) NSString *tipo;
@property (nullable, nonatomic, copy) NSString *url_foto;
@property (nullable, nonatomic, copy) NSString *url_info;
@property (nullable, nonatomic, copy) NSString *url_video;

@end

NS_ASSUME_NONNULL_END
