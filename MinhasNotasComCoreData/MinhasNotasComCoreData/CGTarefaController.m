//
//  CGTarefaController.m
//  MinhasNotasDiarias
//
//  Created by Cast Group on 13/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGTarefaController.h"
#import "AppDelegate.h"
#import "CGTarefa+CoreDataClass.h"

@interface CGTarefaController ()

@property (weak, nonatomic) IBOutlet UITextView *txtDescricaoTarefa;

@property (nonatomic, strong, readonly) NSManagedObjectContext *gerenciadorObjetos;

@end

@implementation CGTarefaController

@synthesize gerenciadorObjetos = _gerenciadorObjetos;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.txtDescricaoTarefa becomeFirstResponder];
    
    if(self.tarefaParaAlteracao) {
        self.txtDescricaoTarefa.text = self.tarefaParaAlteracao.nome;
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSManagedObjectContext*) gerenciadorObjetos{
    
    if (!_gerenciadorObjetos) {
        AppDelegate *delegate =  (AppDelegate*)[UIApplication sharedApplication].delegate;
        _gerenciadorObjetos =  delegate.persistentContainer.viewContext;
    }
    return _gerenciadorObjetos;
}


- (IBAction)addNovaTarefa:(id)sender {
    
    NSError *error = nil;
    
    if(self.tarefaParaAlteracao){
        [self.tarefaParaAlteracao setNome:self.txtDescricaoTarefa.text];
        [self.tarefaParaAlteracao setData:[NSDate date]];
        
        [self.gerenciadorObjetos save:&error];
    } else {
        CGTarefa *novaTarefa = [NSEntityDescription insertNewObjectForEntityForName:@"CGTarefa" inManagedObjectContext:self.gerenciadorObjetos];
        [novaTarefa setNome:self.txtDescricaoTarefa.text];
        [novaTarefa setData:[NSDate date]];
        [novaTarefa setIdentificador: ([self.gerenciadorObjetos executeFetchRequest:[CGTarefa fetchRequest] error:&error].count+1)];
        
        [self.gerenciadorObjetos save:&error];
    }
    
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Serviço" message:@"Registro salvo com sucesso" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *acaoVoltar = [UIAlertAction actionWithTitle:@"Voltar" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *acaoNovo = [UIAlertAction actionWithTitle:@"Novo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.txtDescricaoTarefa.text = @"";
        [self.txtDescricaoTarefa becomeFirstResponder];
    }];
    
    [alert addAction:acaoVoltar];
    [alert addAction:acaoNovo];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
