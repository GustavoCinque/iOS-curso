//
//  CarrosService.m
//  Carros Aula
//
//  Created by C1284047 (Edi Vergis) on 27/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CarrosService.h"
#import "Carro.h"
#import "XMLCarroParser.h"
#import "SMXMLDocument.h"
#import "NSString+Utils.h"
#import "CarroDBCoreData.h"

//#define XML
//#define XML_SAX
#define JSON

@implementation CarrosService

static NSString *URL_CARROS_XML = @"http://www.livroiphone.com.br/carros/carros_%@.xml";
static NSString *URL_CARROS_JSON = @"http://www.livroiphone.com.br/carros/carros_%@.json";

+ (NSArray<Carro *> *)getCarros{
    
    NSMutableArray *carros = [@[] mutableCopy];
    
    for (int i = 0; i < 20; i++) {
        
        Carro *c = [Carro new];
        
        [c setNome:[NSString stringWithFormat:@"Carro %d", i]];
        [c setDesc:[NSString stringWithFormat:@"Desc Carro %d", i]];
        [c setUrl_foto:@"ferrari_ff"];
        [c setUrl_info:@"http://www.google.com.br"];
        
        [carros addObject:c];
        
    }
    
    return carros;
}

+ (void)getCarrosPorTipo:(EnumTipoCarro)enumTipo cache:(BOOL)cache callback:(void (^)(NSArray<Carro *> *, NSError *))callback{

    NSString *tipo = nil;
    switch (enumTipo) {
        case EnumTipoCarroClassicos:
            tipo = @"classicos";
            break;
        case EnumTipoCarroEsportivos:
            tipo = @"esportivos";
            break;
        case EnumTipoCarroLuxo:
            tipo = @"luxo";
            break;
        default:
            break;
    }
    
    if (!tipo) {
        NSLog(@"Tipo inválido");
    }else{
    
        __block NSMutableArray<Carro*> *listaCarros = nil;
        CarroDBCoreData *carroDBCoreData = [CarroDBCoreData new];
        if (cache) {
            //Recuperar informações do CoreData
            NSMutableArray<CarroCD*>* parseArrayCarros =  [carroDBCoreData getCarrosTipo:tipo];
            if (parseArrayCarros.count > 0) {
                listaCarros = [@[] mutableCopy];
            }
            
            for (CarroCD *c in parseArrayCarros) {
                NSLog(@"Carro %@ Mapa lat/lng: %@/%@",c.nome, c.latitude, c.longitude);
                Carro *carro = [Carro new];
                carro.nome = c.nome;
                carro.desc = c.desc;
                carro.url_foto = c.url_foto;
                carro.url_info = c.url_info;
                carro.url_video = c.url_video;
                carro.latitude = c.latitude;
                carro.longitude = c.longitude;
                carro.tipo = c.tipo;
                [listaCarros addObject:carro];
            }
        }
        
        
        if (!listaCarros || listaCarros.count == 0) {
            NSString *urlString = nil;
#if defined XML || defined XML_SAX
            NSLog(@"Arquivo XML");
            urlString = [NSString stringWithFormat:URL_CARROS_XML, tipo];
#elif defined JSON
            NSLog(@"Arquivo JSON");
            urlString = [NSString stringWithFormat:URL_CARROS_JSON, tipo];
#endif
            
            NSURL *url = [NSURL URLWithString:urlString];
            
            //Consumindo dados da WEB
            [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                if (error) {
                    NSLog(@"Erro ao consumir dados da WEB, recuperando arquivo local");
                    //Consumindo dados locais
                    data = [self recuperarDadosDoArquivoLocalPeloTipo:tipo];
                    
                }else{
                    NSLog(@"Dados recuperados da WEB com sucesso!");
                }
                
                if (data) {
#if defined XML
                    listaCarros =  [self parserXML_DOM:data];
#elif defined XML_SAX
                    listaCarros =  [self parserXML_SAX:data];
#elif defined JSON
                    listaCarros =  [self parseJSON:data];
#endif
                    
                    if (listaCarros) {
                        
                        // Deletar os registros antigos
                        [carroDBCoreData deletarCarrosTipo:tipo];
                        // Agora vamos salvar cada carro
                        for (Carro *c in listaCarros) {
                            
                            // Atualiza o tipo para salvar o valor neste coluna
                            CarroCD *carroCD = [CarroDBCoreData newInstance];
                            carroCD.nome = c.nome;
                            carroCD.desc = c.desc;
                            carroCD.url_foto = c.url_foto;
                            carroCD.url_info = c.url_info;
                            carroCD.url_video = c.url_video;
                            carroCD.latitude = c.latitude;
                            carroCD.longitude = c.longitude;
                            carroCD.tipo = c.tipo;
                            
                            if (!carroCD.tipo) {
                                carroCD.tipo = tipo;
                            }
                            
                            [carroDBCoreData salvar:carroCD];
                        }
                    }
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    callback(listaCarros, nil);
                });
                
            }] resume];
            
        }else{
         callback(listaCarros, nil);
        }
    }
    
}

+ (NSData*) recuperarDadosDoArquivoLocalPeloTipo:(NSString*)tipo{
    NSData *data = nil;
    //Consumindo dados locais
    NSString *stringPath = [NSString stringWithFormat:@"carros_%@", tipo];
    
    NSString *sourcePath = nil;
#if defined XML || defined XML_SAX
    sourcePath = [[NSBundle mainBundle] pathForResource:stringPath ofType:@"xml"];
#elif defined JSON
    //Recuperando arquivo JSON
    sourcePath = [[NSBundle mainBundle] pathForResource:stringPath ofType:@"json"];
#endif
    
    if (sourcePath) {
        
       data = [[NSData alloc] initWithContentsOfFile:sourcePath];
        
    }else{
        NSLog(@"Arquivo não encontrado!");
    }
    return data;
}

+ (NSMutableArray<Carro*>*) parserXML_SAX:(NSData*)data{
    NSLog(@"Parse por %@",NSStringFromSelector(_cmd));
    if (!data || [data length] == 0) {
        NSLog(@"Nenhum dado foi encontrado");
    }
    
    NSXMLParser *xmlParser = [[NSXMLParser new] initWithData:data];
    
    XMLCarroParser *xmlCarroParser = [XMLCarroParser new];
    [xmlParser setDelegate:xmlCarroParser];
    
    NSMutableArray<Carro*> *listaCarros;
    if ([xmlParser parse]) {
        listaCarros = xmlCarroParser.carros;
    }else{
        NSLog(@"Erro no parser");
    }
    
    return listaCarros;
}


+ (NSMutableArray<Carro*>*) parserXML_DOM:(NSData*)data{
    NSLog(@"Parse por %@",NSStringFromSelector(_cmd));
    if (!data || [data length] == 0) {
        NSLog(@"Nenhum dado foi encontrado");
    }
    
    NSMutableArray<Carro*> *listaCarros;
    NSError *error;
    
    SMXMLDocument *dom = [SMXMLDocument documentWithData:data error:&error];
    
    if (error) {
        NSLog(@"Erro em fazer o parse do xml: %@", error);
    }else{
        
        listaCarros = [@[] mutableCopy];
        
        SMXMLDocument *tagCarros = dom;
        
        for (SMXMLElement *tagCarro in [tagCarros childrenNamed:@"carro"]) {
            
            Carro *c = [Carro new];
            c.nome = [[tagCarro valueWithPath:@"nome"] clearCharsets];
            c.desc = [[tagCarro valueWithPath:@"desc"] clearCharsets];
            c.url_info = [[tagCarro valueWithPath:@"url_info"] clearCharsets];
            c.url_foto = [[tagCarro valueWithPath:@"url_foto"] clearCharsets];
            c.url_video = [[tagCarro valueWithPath:@"url_video"] clearCharsets];
            c.latitude = [[tagCarro valueWithPath:@"latitude"] clearCharsets];
            c.longitude = [[tagCarro valueWithPath:@"longitude"] clearCharsets];
            [listaCarros addObject:c];
            
        }
        
    }
    
    
    return listaCarros;
    
}

+ (NSMutableArray<Carro*>*) parseJSON:(NSData*)data{
    NSLog(@"Parse por %@",NSStringFromSelector(_cmd));
    if (!data || [data length] == 0) {
        NSLog(@"Nenhum dado foi encontrado");
    }
    
    NSError *jsonError;
    RootCarro *rootCarro = [[RootCarro alloc] initWithData:data error:&jsonError];
    
    if (jsonError) {
        NSLog(@"Error %@", jsonError.description);
    }

    return rootCarro.carros.carro;
}


@end









