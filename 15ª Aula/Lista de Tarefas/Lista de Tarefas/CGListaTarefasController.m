//
//  CGListaTarefasController.m
//  LIsta de Tarefas
//
//  Created by C1284047 (Edi Vergis) on 13/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGListaTarefasController.h"
#import "CGTarefaService.h"
#import "CGTarefaServiceArchiver.h"

@interface CGListaTarefasController ()

@property (nonatomic, strong) NSArray<NSString*>*listaTarefas;
@property (nonatomic, strong) NSArray<CGTarefa*>*listaTarefasArchiver;

@end

@implementation CGListaTarefasController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //self.listaTarefas = [[CGTarefaService new] recuperarTarefas];
    
    self.listaTarefasArchiver = [[CGTarefaServiceArchiver new] recuperarTarefas];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.listaTarefas.count;
    return self.listaTarefasArchiver.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellTarefa" forIndexPath:indexPath];
    
    //NSString *sTarefa = self.listaTarefas[indexPath.row];
    //cell.textLabel.text = sTarefa;
    
    CGTarefa *tarefa = self.listaTarefasArchiver[indexPath.row];
    cell.textLabel.text = tarefa.nome;
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    
    cell.detailTextLabel.text = [formatter stringFromDate:tarefa.data];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //CGTarefaService *service = [CGTarefaService new];
        
        //[service removerTarefa:self.listaTarefas[indexPath.row]];
        
        //self.listaTarefas = [service recuperarTarefas];
        
        CGTarefaServiceArchiver *service = [CGTarefaServiceArchiver new];
        
        CGTarefa *tarefa = self.listaTarefasArchiver[indexPath.row];
        
        [service removerTarefa:tarefa];
        
        self.listaTarefasArchiver = [service recuperarTarefas];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
