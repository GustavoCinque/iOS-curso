//
//  CGTarefaService.h
//  LIsta de Tarefas
//
//  Created by C1284047 (Edi Vergis) on 13/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGTarefaService : NSObject

- (NSArray<NSString*>*) recuperarTarefas;

- (void) adicionarTarefa:(NSString*)novaTarefa;

- (void) removerTarefa:(NSString*)aTarefa;


@end
