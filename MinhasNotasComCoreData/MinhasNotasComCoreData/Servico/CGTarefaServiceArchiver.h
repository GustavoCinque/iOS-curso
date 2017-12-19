//
//  CGTarefaServiceArchiver.h
//  MinhasNotasDiarias
//
//  Created by Cast Group on 14/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGTarefa.h"

@interface CGTarefaServiceArchiver : NSObject

- (NSArray<CGTarefa*>*) recuperarTarefas;

- (void) adicionarTarefa:(CGTarefa*)novaTarefa;

- (void) removerTarefa:(CGTarefa*)tarefa;

@end
