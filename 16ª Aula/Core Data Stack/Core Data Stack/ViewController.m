//
//  ViewController.m
//  Core Data Stack
//
//  Created by C1284047 (Edi Vergis) on 15/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Pessoa+CoreDataClass.h"

@interface ViewController ()

@property (nonatomic, strong, readonly) NSManagedObjectContext *gerenciadorObjetos;

@end

@implementation ViewController

@synthesize gerenciadorObjetos = _gerenciadorObjetos;

- (NSManagedObjectContext*) gerenciadorObjetos{
    
    if (!_gerenciadorObjetos) {
        
       AppDelegate *delegate =  (AppDelegate*)[UIApplication sharedApplication].delegate;
        _gerenciadorObjetos =  delegate.persistentContainer.viewContext;
    }
    return _gerenciadorObjetos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Criando o objeto no contexto do CoreData
    
    //Criando o primeiro objeto
    Pessoa *pessoa = [NSEntityDescription insertNewObjectForEntityForName:@"Pessoa" inManagedObjectContext:self.gerenciadorObjetos];
    
    [pessoa setNome:@"Edi"];
    [pessoa setSobrenome:@"Vergis"];
    [pessoa setIdade:(33)];
    
    //Reaproveitando a variável e Criando o segundo objeto
    pessoa = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Pessoa class]) inManagedObjectContext:self.gerenciadorObjetos];
    
    [pessoa setNome:@"Bruna"];
    [pessoa setSobrenome:@"Vergis"];
    [pessoa setIdade:(26)];
    

    //Reaproveitando a variável e Criando o terceiro objeto
    pessoa = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Pessoa class]) inManagedObjectContext:self.gerenciadorObjetos];
    [pessoa setNome:@"Daniel"];
    [pessoa setSobrenome:@"Vergis"];
    [pessoa setIdade:(1.7)];

    
    NSError *error = nil;
    //Salvando tudo o que foi criado dentro do contexto
    [self.gerenciadorObjetos save:&error];
    
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }else{
        NSLog(@"Salvo com sucesso");
        
        NSFetchRequest *request = [Pessoa fetchRequest];
        
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%@ contains[cd] %@", NSStringFromSelector(@selector(nome)), @"Edi"];
        [request setPredicate:predicate];
        
        //Ordenação pela property do objeto
        // NSSortDescriptor *sortDescriptor= [NSSortDescriptor sortDescriptorWithKey:@"idade" ascending:NO];
        //[request setSortDescriptors:@[sortDescriptor]];
        
        NSArray<NSManagedObject*> *listaObjetos = [self.gerenciadorObjetos executeFetchRequest:request error:&error];
        
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }else{
            
            for (NSManagedObject *obj in listaObjetos) {
                
                //[obj setValue:@"Edi Alterado" forKey: @"nome"];
                
                //[self.gerenciadorObjetos deleteObject:obj];
                
                
                NSLog(@"Nome: %@ \n", [obj valueForKey:@"nome"]);
                NSLog(@"Sobrenome: %@ \n", [obj valueForKey:@"sobrenome"]);
                NSLog(@"Idade: %d \n", [[obj valueForKey:@"idade"] intValue]);
                
            }
            
            /*[self.gerenciadorObjetos save:&error];
            
            if (error) {
                NSLog(@"%@", error.localizedDescription);
            }else{
                NSLog(@"Salvo com sucesso");
            }*/
        }
    }
    
}

-(NSArray<Class>*) filtrarClasse:(Class) classe comSeletor:(SEL) seletor comParametro:(NSString*)parametro {
    if([classe instancesRespondToSelector:@selector(fetchRequest)] && [classe instancesRespondToSelector:seletor]) {
        NSFetchRequest *request = [classe fetchRequest];
        [request setPredicate:[NSPredicate predicateWithFormat:@"%@ contains[cd] %@", NSStringFromSelector(seletor), parametro]];
        NSError *error = nil;
        return [self.gerenciadorObjetos executeFetchRequest:request error:&error];
    }
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
