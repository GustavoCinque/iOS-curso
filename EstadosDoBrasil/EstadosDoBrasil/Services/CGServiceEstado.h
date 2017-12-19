#import <Foundation/Foundation.h>
#import "CGEstado.h"
@interface CGServiceEstado : NSObject

- (NSArray*) recuperarEstados;

- (CGEstado *) criaEstado:(NSString*) nome comSigla:(NSString*) sigla comCapital:(NSString*) capital comRegiao:(CGEnumRegiao) regiao comNomeImagem:(NSString*) nomeImagem;

- (NSDictionary<NSNumber*,NSArray<CGEstado*>*> *)recuperaDicionarioEstadosPorRegioes;
@end
