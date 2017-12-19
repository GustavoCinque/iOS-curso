//
//  CGListaTarefasController.m
//  MinhasNotasDiarias
//
//  Created by Cast Group on 13/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGListaTarefasController.h"
#import "CGTarefa+CoreDataClass.h"
#import "AppDelegate.h"
#import "CGTarefaController.h"

@interface CGListaTarefasController ()

@property (nonatomic, strong, readonly) NSManagedObjectContext *gerenciadorObjetos;

@property(nonatomic, strong) NSArray<NSManagedObject*> *notas;

@end

@implementation CGListaTarefasController

@synthesize gerenciadorObjetos = _gerenciadorObjetos;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSManagedObjectContext*) gerenciadorObjetos{
    
    if (!_gerenciadorObjetos) {
        
        AppDelegate *delegate =  (AppDelegate*)[UIApplication sharedApplication].delegate;
        _gerenciadorObjetos =  delegate.persistentContainer.viewContext;
    }
    return _gerenciadorObjetos;
}


- (void)viewWillAppear:(BOOL)animated {
    
    NSError *error = nil;
    NSFetchRequest *request = [CGTarefa fetchRequest];
    
    NSSortDescriptor *sortDescriptor= [NSSortDescriptor sortDescriptorWithKey:@"identificador" ascending:NO];
    [request setSortDescriptors:@[sortDescriptor]];
    
    self.notas = [self.gerenciadorObjetos executeFetchRequest:request error:&error];
       
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
    return self.notas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellTarefa" forIndexPath:indexPath];
    
    //NSString *sTarefa = self.listaTarefas[indexPath.row];
    CGTarefa *sTarefa = self.notas[indexPath.row];
    
    //cell.textLabel.text = sTarefa;
    cell.textLabel.text = sTarefa.nome;
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd/MM/yyyy hh:mm"];
    cell.detailTextLabel.text = [formatter stringFromDate:sTarefa.data];
    
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
        [self.gerenciadorObjetos deleteObject:self.notas[indexPath.row]];
        NSError *error = nil;
        [self.gerenciadorObjetos save:&error];
        [self viewWillAppear:true];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier  isEqual: @"segueAlteracao"] ) {
        NSIndexPath *path = [self.tableView indexPathForCell:sender];
        CGTarefaController *tarefa = segue.destinationViewController;
        tarefa.tarefaParaAlteracao = self.notas[path.row];
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
