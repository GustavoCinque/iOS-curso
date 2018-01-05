//
//  CarroDBCoreData.m
//  Carros
//
//  Created by Edi Vergis on 27/12/2017.
//  Copyright © 2017 Edi Vergis. All rights reserved.
//

#import "CarroDBCoreData.h"
#import "AppDelegate.h"

@implementation CarroDBCoreData

+ (NSManagedObjectContext*)context{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    return appDelegate.persistentContainer.viewContext;
}

+ (CarroCD *) newInstance {
    // Cria uma instância do Carro (inserindo no managed object context)
    CarroCD *c = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([CarroCD class]) inManagedObjectContext:[CarroDBCoreData context]];
    return c;
}

- (NSMutableArray<CarroCD*> *) getCarrosTipo:(NSString *)tipo {

    // Context para salvar/deletar/buscar objetos
    NSManagedObjectContext *context = [CarroDBCoreData context];

    // Cria a request com os filtros da consulta
    NSFetchRequest *request = [CarroCD fetchRequest];
    // Buscar por tipo, where tipo=?
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tipo = %@",tipo];
    [request setPredicate:predicate];
    // Ordena a consulta por ‘timestamp'
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timestamp"
                                                                   ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    // Executa a consulta
    NSError *error;
    NSMutableArray *array = [[context executeFetchRequest:request error:&error] mutableCopy];
    if (!array) {
        // Tratar erros aqui
        NSLog(@"Erro %@", error);
        
        return nil;
    }
    NSLog(@"DB > getCarrosTipo[%@]: %@", tipo, array);
    return array;
}
- (void) salvar:(CarroCD *)carro {
    // Context para salvar/deletar/buscar objetos
    NSManagedObjectContext *context = [CarroDBCoreData context];
    NSLog(@"Salvando Carro [%@]", carro);
    // Seta o timestamp (como se fosse o id)
    if (!carro.timestamp) {
        carro.timestamp = [NSDate date];
    }
    NSError *error;
    BOOL saveOk = [context save:&error];
    if (!saveOk) {
        // Tratar erros aqui
        NSLog(@"Erro %@", error);
    } else {
        NSLog(@"Carro [%@] salvo com sucesso", carro);
    }
}
- (void) deletarCarrosTipo:(NSString *)tipo {
    // Consulta os carros por tipo
    NSMutableArray *carros = [self getCarrosTipo:tipo];
    // Deleta todos os carros
    for (CarroCD *c in carros) {
        [self deletar:c];
    }
}
- (void) deletar:(CarroCD *)carro {
    // Context para salvar/deletar/buscar objetos
    NSManagedObjectContext *context = [CarroDBCoreData context];
    [context deleteObject:carro];
    [context save:nil];
}


@end
