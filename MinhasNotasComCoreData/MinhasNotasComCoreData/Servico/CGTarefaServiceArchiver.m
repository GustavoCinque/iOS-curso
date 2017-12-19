//
//  CGTarefaServiceArchiver.m
//  MinhasNotasDiarias
//
//  Created by Cast Group on 14/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGTarefaServiceArchiver.h"
@implementation CGTarefaServiceArchiver

static NSString *kListaTarefas = @"kTarefasArchiver";

- (NSUserDefaults*) userDefaults {
    return [NSUserDefaults standardUserDefaults];
}

- (void) salvarLista:(NSMutableArray<CGTarefa*> *)listaTarefas {
    
    NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:listaTarefas.count];
    
    for (CGTarefa *tarefa in listaTarefas) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tarefa];
        [dataArray addObject:data];
    }
    
    [[self userDefaults] setObject:dataArray forKey:kListaTarefas];
    //[[self userDefaults] setObject:listaTarefas forKey:kListaTarefas];
    [[self userDefaults] synchronize];
}

- (NSArray<CGTarefa *> *)recuperarTarefas {
    
    //NSMutableArray<CGTarefa*>* array = [[self userDefaults] objectForKey:kListaTarefas];
    NSMutableArray<NSData*>* listaTarefasData = [[self userDefaults] objectForKey:kListaTarefas];
    
    NSMutableArray<CGTarefa*> *listaTarefas = nil;
    if (listaTarefasData.count > 0) {
        
        listaTarefas = [NSMutableArray arrayWithCapacity:listaTarefasData.count];
        
        for (NSData *tarefaData in listaTarefasData) {
            CGTarefa *tarefa = (CGTarefa*)[NSKeyedUnarchiver unarchiveObjectWithData:tarefaData];
            [listaTarefas addObject:tarefa];
        }
    }
    
    if (!listaTarefas) { // ou != nil
        listaTarefas = [@[] mutableCopy];
        [self salvarLista:listaTarefas];
    }
    
    return listaTarefas;
    
}

- (void)adicionarTarefa:(CGTarefa *)novaTarefa {
    
    NSMutableArray<CGTarefa*>* tarefas = [NSMutableArray arrayWithArray:[self recuperarTarefas]];
    
    [tarefas addObject:novaTarefa];
    
    [self salvarLista:tarefas];
    
}

- (void)removerTarefa:(CGTarefa *)tarefa {
    
    NSMutableArray<CGTarefa*>* tarefas = [NSMutableArray arrayWithArray:[self recuperarTarefas]];
    
    [tarefas removeObject:tarefa];
    
    [self salvarLista:tarefas];
    
}


@end
