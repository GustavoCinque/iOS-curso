//
//  CGTarefaServiceArchiver.h
//  Lista de Tarefas
//
//  Created by C1284047 (Edi Vergis) on 14/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGTarefa.h"

@interface CGTarefaServiceArchiver : NSObject

- (NSArray<CGTarefa*>*) recuperarTarefas;

- (void) adicionarTarefa:(CGTarefa*)novaTarefa;

- (void) removerTarefa:(CGTarefa*)aTarefa;

@end
