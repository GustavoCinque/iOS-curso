//
//  CGTarefaService.m
//  LIsta de Tarefas
//
//  Created by C1284047 (Edi Vergis) on 13/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGTarefaService.h"

@implementation CGTarefaService

static NSString *kListaTarefas = @"kTarefas";

- (NSUserDefaults*) userDefaults{
    return [NSUserDefaults standardUserDefaults];
}

- (void) salvarLista:(NSMutableArray<NSString*>*)listaTarefas{
    [[self userDefaults] setObject:listaTarefas forKey:kListaTarefas];
    [[self userDefaults] synchronize];
}

- (NSArray<NSString *> *)recuperarTarefas{
    
    NSMutableArray<NSString*>* array = [[self userDefaults] objectForKey:kListaTarefas];
    
    if (!array) {
        array = [@[] mutableCopy];
        [self salvarLista:array];
    }
    
    return array;
}

- (void)adicionarTarefa:(NSString *)novaTarefa{

    NSMutableArray<NSString*> * tarefas = [NSMutableArray arrayWithArray:[self recuperarTarefas]];
    
    [tarefas addObject:novaTarefa];
    [self salvarLista:tarefas];
    
}

- (void)removerTarefa:(NSString *)aTarefa{
    
    NSMutableArray<NSString*> * tarefas = [NSMutableArray arrayWithArray:[self recuperarTarefas]];
    
    [tarefas removeObject:aTarefa];
    [self salvarLista:tarefas];
}

@end








