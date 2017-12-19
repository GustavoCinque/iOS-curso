//
//  ViewController.m
//  Core Data Stack
//
//  Created by C1284047 (Edi Vergis) on 14/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (nonatomic, strong)  AppDelegate *appDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    //NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Pessoa" inManagedObjectContext:self.appDelegate.persistentContainer.viewContext];
    
    // [object setValue:@"Edi" forKey:@"nome"];
    //[object setValue:@"Vergis" forKey:@"sobrenome"];
    
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Pessoa"];

    NSError *error = nil;
    NSArray<NSManagedObject*> *listaObjetos = [self.appDelegate.persistentContainer.viewContext executeFetchRequest:fetch error:&error];
    
    if (!error) {
        for (NSManagedObject *object in listaObjetos) {
            
            NSLog(@"Nome: %@ \n", [object valueForKey:@"nome"]);
            NSLog(@"Sobrenome: %@", [object valueForKey:@"sobrenome"]);
            
        }
    }else{
        NSLog(@"Erro ao executar isntrução %@", [error description]);
    }
    
    
    
    [self.appDelegate.persistentContainer.viewContext save:&error];
    
    if (error) {
        NSLog(@"Erro ao executar isntrução %@", [error description]);
    }else{
        NSLog(@"Salvo com sucesso!");
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
