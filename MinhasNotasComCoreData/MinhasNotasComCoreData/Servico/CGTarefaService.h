//
//  CGTarefaService.h
//  MinhasNotasDiarias
//
//  Created by Cast Group on 13/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CGTarefaService : NSObject

- (NSArray<NSString*>*) recuperarTarefas;

- (void) adicionarTarefa:(NSString*)novaTarefa;

- (void) removerTarefa:(NSString*)tarefa;

@end
