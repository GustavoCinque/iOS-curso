#import "CGServiceEstado.h"

@implementation CGServiceEstado

- (NSArray<CGEstado *> *) recuperarEstados{
    NSMutableArray *arrayEstados = [@[] mutableCopy];
    
    [arrayEstados addObject:[self criaEstado:@"Acre" comSigla:@"AC" comCapital:@"Rio Branco" comRegiao:CGEnumRegiaoNorte comNomeImagem:@"acre.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Amapá" comSigla:@"AP" comCapital:@"Macapá" comRegiao:CGEnumRegiaoNorte comNomeImagem:@"amapa.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Amazonas" comSigla:@"AM" comCapital:@"Manaus" comRegiao:CGEnumRegiaoNorte comNomeImagem:@"amazonas.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Roraima" comSigla:@"RR" comCapital:@"Belém" comRegiao:CGEnumRegiaoNorte comNomeImagem:@"roraima.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Pará" comSigla:@"PA" comCapital:@"Macapá" comRegiao:CGEnumRegiaoNorte comNomeImagem:@"para.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Tocantins" comSigla:@"TO" comCapital:@"Palmas" comRegiao:CGEnumRegiaoNorte comNomeImagem:@"tocantins.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Rondônia" comSigla:@"RO" comCapital:@"Porto Velho" comRegiao:CGEnumRegiaoNorte comNomeImagem:@"rondonia.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Maranhão" comSigla:@"MA" comCapital:@"São Luís" comRegiao:CGEnumRegiaoNordeste comNomeImagem:@"maranhao.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Piauí" comSigla:@"PI" comCapital:@"Teresina" comRegiao:CGEnumRegiaoNordeste comNomeImagem:@"piaui.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Ceará" comSigla:@"CE" comCapital:@"Fortaleza" comRegiao:CGEnumRegiaoNordeste comNomeImagem:@"ceara.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Rio Grande do Norte" comSigla:@"RN" comCapital:@"Natal" comRegiao:CGEnumRegiaoNordeste comNomeImagem:@"rio_grande_do_norte.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Pernambuco" comSigla:@"PE" comCapital:@"Recife" comRegiao:CGEnumRegiaoNorte comNomeImagem:@"pernambuco.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Paraíba" comSigla:@"PB" comCapital:@"João Pessoa" comRegiao:CGEnumRegiaoNordeste comNomeImagem:@"paraiba.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Sergipe" comSigla:@"SE" comCapital:@"Aracaju" comRegiao:CGEnumRegiaoNordeste comNomeImagem:@"sergipe.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Alagoas" comSigla:@"AL" comCapital:@"Maceió" comRegiao:CGEnumRegiaoNordeste comNomeImagem:@"alagoas.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Bahia" comSigla:@"BA" comCapital:@"Salvador" comRegiao:CGEnumRegiaoNordeste comNomeImagem:@"bahia.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Mato Grosso" comSigla:@"MT" comCapital:@"Cuiabá" comRegiao:CGEnumRegiaoCentroOeste comNomeImagem:@"mato_grosso.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Mato Grosso do Sul" comSigla:@"MS" comCapital:@"Campo Grande" comRegiao:CGEnumRegiaoCentroOeste comNomeImagem:@"mato_grosso_do_sul.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Goiás" comSigla:@"GO" comCapital:@"Goiânia" comRegiao:CGEnumRegiaoCentroOeste comNomeImagem:@"goias.png"]];

    [arrayEstados addObject:[self criaEstado:@"São Paulo" comSigla:@"SP" comCapital:@"São Paulo" comRegiao:CGEnumRegiaoSudeste comNomeImagem:@"sao_paulo.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Rio de Janeiro" comSigla:@"RJ" comCapital:@"Rio de Janeiro" comRegiao:CGEnumRegiaoSudeste comNomeImagem:@"rio_de_janeiro.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Espírito Santo" comSigla:@"ES" comCapital:@"Vitória" comRegiao:CGEnumRegiaoSudeste comNomeImagem:@"espirito_santo.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Minas Gerais" comSigla:@"MG" comCapital:@"Belo Horizonte" comRegiao:CGEnumRegiaoSudeste comNomeImagem:@"minas_gerais.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Paraná" comSigla:@"PR" comCapital:@"Curitiba" comRegiao:CGEnumRegiaoSul comNomeImagem:@"parana.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Rio Grande do Sul" comSigla:@"RS" comCapital:@"Porto Alegre" comRegiao:CGEnumRegiaoSul comNomeImagem:@"rio_grande_do_sul.png"]];
    
    [arrayEstados addObject:[self criaEstado:@"Santa Catarina" comSigla:@"SC" comCapital:@"Florianópolis" comRegiao:CGEnumRegiaoSul comNomeImagem:@"santa_catarina.png"]];
    
    return arrayEstados;
}

- (CGEstado *) criaEstado:(NSString*) nome comSigla:(NSString*) sigla comCapital:(NSString*) capital comRegiao:(CGEnumRegiao) regiao comNomeImagem:(NSString*) nomeImagem{
    CGEstado *estado = [CGEstado new];
    
    [estado setNome:nome];
    [estado setSigla:sigla];
    [estado setCapital:capital];
    [estado setRegiao:regiao];
    [estado setNomeImagem:nomeImagem];
    
    return estado;
    
}

-(NSDictionary<NSNumber*,NSArray<CGEstado*>*> *)recuperaDicionarioEstadosPorRegioes {


    NSArray *listaEstados = [self recuperarEstados];
    
    NSMutableDictionary *dicionarioEstadoRegiao = [@{} mutableCopy];
    
    for (CGEstado *estado in listaEstados) {
        NSMutableArray *listaEstadoRegiao = [dicionarioEstadoRegiao objectForKey:@(estado.regiao)];
        if(listaEstadoRegiao == nil) {
            listaEstadoRegiao = [@[] mutableCopy];
            [dicionarioEstadoRegiao setObject:listaEstadoRegiao forKey:@(estado.regiao)];
        }
        [listaEstadoRegiao addObject:estado];
    }
    
    return dicionarioEstadoRegiao;
    
}

@end
