//
//  FilmeController.m
//  MeusFilmes
//
//  Created by Cast Group on 11/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "FilmeController.h"
#import "FilmeService.h"
#import "FilmeCell.h"
#import "Filme.h"
#import "DetalheFilmeController.h"

@interface FilmeController ()

@property(nonatomic, strong) NSArray* filmes;

@end

@implementation FilmeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.filmes = [[FilmeService new] recuperaFilmes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filmes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FilmeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"filmeCell" forIndexPath:indexPath];
  
    Filme *filme = self.filmes[indexPath.row];
    
    cell.nome.text = filme.nome;
    cell.descricao.text = filme.descricao;
    cell.filmeImageView.image = [UIImage imageNamed:filme.imagem];
 
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    FilmeCell *cell = (FilmeCell*) sender;
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    DetalheFilmeController *detalheFilmeController = segue.destinationViewController;
    detalheFilmeController.filme = self.filmes[path.row];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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
