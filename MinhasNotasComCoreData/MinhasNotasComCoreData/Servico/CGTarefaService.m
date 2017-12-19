//
//  CGTarefaService.m
//  MinhasNotasDiarias
//
//  Created by Cast Group on 13/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGTarefaService.h"

@implementation CGTarefaService

static NSString *kListaTarefas = @"kTarefas";

- (NSUserDefaults*) userDefaults {
    return [NSUserDefaults standardUserDefaults];
}

- (void) salvarLista:(NSMutableArray<NSString*> *)listaTarefas {
    [[self userDefaults] setObject:listaTarefas forKey:kListaTarefas];
    [[self userDefaults] synchronize];
}

- (NSArray<NSString *> *)recuperarTarefas {
    
    NSMutableArray<NSString*>* array = [[self userDefaults] objectForKey:kListaTarefas];
    
    if (!array) { // ou != nil
        array = [@[] mutableCopy];
        [self salvarLista:array];
    }
    
    return array;
    
}

- (void)adicionarTarefa:(NSString *)novaTarefa {
    
    NSMutableArray<NSString*>* tarefas = [NSMutableArray arrayWithArray:[self recuperarTarefas]];
    
    [tarefas addObject:novaTarefa];
    
    [self salvarLista:tarefas];
    
}

- (void)removerTarefa:(NSString *)tarefa {
    
    NSMutableArray<NSString*>* tarefas = [NSMutableArray arrayWithArray:[self recuperarTarefas]];
    
    [tarefas removeObject:tarefa];
    
    [self salvarLista:tarefas];
    
}

@end
