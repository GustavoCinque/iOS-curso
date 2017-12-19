//
//  CGNovaTarefaController.m
//  LIsta de Tarefas
//
//  Created by C1284047 (Edi Vergis) on 13/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGNovaTarefaController.h"
#import "CGTarefaService.h"
#import "CGTarefaServiceArchiver.h"

@interface CGNovaTarefaController ()
@property (weak, nonatomic) IBOutlet UITextField *txtDescricaoTarefa;

@end

@implementation CGNovaTarefaController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addNovaTarefa:(id)sender {
    
    
    CGTarefaServiceArchiver *service = [CGTarefaServiceArchiver new];
    
    CGTarefa *novaTarefa = [CGTarefa new];
    [novaTarefa setNome:self.txtDescricaoTarefa.text];
    [novaTarefa setData:[NSDate date]];
    [service adicionarTarefa:novaTarefa];
    
    //CGTarefaService *service = [CGTarefaService new];
    //[service adicionarTarefa:self.txtDescricaoTarefa.text];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Serviço" message:@"Registro salvo com sucesso!" preferredStyle:UIAlertControllerStyleAlert];
    
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
