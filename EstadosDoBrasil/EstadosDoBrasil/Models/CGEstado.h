#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CGEnumRegiao) {
    CGEnumRegiaoNorte,
    CGEnumRegiaoNordeste,
    CGEnumRegiaoSul,
    CGEnumRegiaoSudeste,
    CGEnumRegiaoCentroOeste
};

@interface CGEstado : NSObject

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *capital;
@property (nonatomic, strong) NSString *sigla;
@property (nonatomic, assign) CGEnumRegiao regiao;
@property (nonatomic, strong) NSString *nomeImagem;

-(NSString *) obtemRegiao;

-(NSString *) obtemNomeCompleto;

@end
