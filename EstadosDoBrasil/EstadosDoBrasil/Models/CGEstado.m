#import "CGEstado.h"

@implementation CGEstado

-(NSString *) obtemRegiao {
    if(_regiao == CGEnumRegiaoNorte) { return @"Região Norte"; }
    else if(_regiao == CGEnumRegiaoNordeste) { return @"Região Nordeste"; }
    else if(_regiao == CGEnumRegiaoSul) { return @"Região Sul"; }
    else if(_regiao == CGEnumRegiaoSudeste) { return @"Região Sudeste"; }
    else if(_regiao == CGEnumRegiaoCentroOeste) { return @"Região Centro-Oeste";}
    return @"Não encontrado";
}

-(NSString *) obtemNomeCompleto {
    return [self.nome stringByAppendingString:[NSString stringWithFormat:@"(%@)", self.sigla]];
}

@end
