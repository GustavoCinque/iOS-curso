//
//  ViagensViewController.m
//  Minhas Viagens
//
//  Created by Cast Group on 20/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViagensViewController.h"
#import "AppDelegate.h"
#import "Viagem+CoreDataClass.h"
#import "MapaViewController.h"


@interface ViagensViewController ()

@property (nonatomic, strong, readonly) NSManagedObjectContext *gerenciadorObjetos;

@property(nonatomic, strong) NSArray<NSManagedObject*> *viagens;

@end

@implementation ViagensViewController

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

-(void)viewWillAppear:(BOOL)animated {
    NSError *error = nil;
    NSFetchRequest *request = [Viagem fetchRequest];
    
    NSSortDescriptor *sortDescriptor= [NSSortDescriptor sortDescriptorWithKey:@"latitude" ascending:NO];
    [request setSortDescriptors:@[sortDescriptor]];
    
    self.viagens = [self.gerenciadorObjetos executeFetchRequest:request error:&error];
    
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
    return self.viagens.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"viagemCell" forIndexPath:indexPath];
    
    Viagem *viagem = self.viagens[indexPath.row];
    cell.textLabel.text = viagem.descricao;
    
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"segueCell"]) {
        NSIndexPath *path = [self.tableView indexPathForCell:sender];
        MapaViewController *mapa = segue.destinationViewController;
        mapa.viagemApresentacao = self.viagens[path.row];
    }
    
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
        [self.gerenciadorObjetos deleteObject:self.viagens[indexPath.row]];
        NSError *error = nil;
        [self.gerenciadorObjetos save:&error];
        [self viewWillAppear:true];
    }
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
