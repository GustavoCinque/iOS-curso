//
//  CGListarEstadosController.m
//  EstadosDoBrasil
//
//  Created by Cast Group on 06/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGListarEstadosController.h"
#import "CGServiceEstado.h"
#import "TableCellEstado.h"

@interface CGListarEstadosController ()

@property(nonatomic, strong) NSArray *listaEstados;

@property(nonatomic, strong) NSDictionary *dicEstadoRegiao;

@end

@implementation CGListarEstadosController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGServiceEstado *service = [CGServiceEstado new];
    self.listaEstados = [service recuperarEstados];
    self.dicEstadoRegiao = [service recuperaDicionarioEstadosPorRegioes];
    
    [self.tableView registerNib: [UINib nibWithNibName:@"TableCellEstado" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellEstado"];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 300;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dicEstadoRegiao.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self dicEstadoRegiao] objectForKey:@(section)] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableCellEstado *cell = [tableView dequeueReusableCellWithIdentifier:@"cellEstado" forIndexPath:indexPath];
    
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCellEstado" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    CGEstado *estado = [self.dicEstadoRegiao objectForKey:@(indexPath.section)][indexPath.row];

    cell.nome.text = [estado obtemNomeCompleto];
    cell.capital.text = estado.capital;
    cell.imageView.image = [UIImage imageNamed:estado.nomeImagem];
    cell.regiao.text = [estado obtemRegiao];
    
    return cell;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if((CGEnumRegiao) section == CGEnumRegiaoNorte) { return @"Norte"; }
    else if((CGEnumRegiao) section == CGEnumRegiaoNordeste) { return @"Nordeste"; }
    else if((CGEnumRegiao) section == CGEnumRegiaoSul) { return @"Sul"; }
    else if((CGEnumRegiao) section == CGEnumRegiaoSudeste) { return @"Sudeste"; }
    else if((CGEnumRegiao) section == CGEnumRegiaoCentroOeste) { return @"Centro-Oeste";}
    return @"Não encontrado";

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGEstado *estado = [self.dicEstadoRegiao objectForKey:@(indexPath.section)][indexPath.row];
    
    NSString *mensagem = [NSString stringWithFormat:@"O Estado que você selecionou foi %@ da %@", [estado nome], [estado obtemRegiao]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Estado selecionado" message:mensagem preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *acaoOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *acaoCancelar = [UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *acaoExcluir = [UIAlertAction actionWithTitle:@"Excluir" style:UIAlertActionStyleDestructive handler:nil];
    
    [alert addAction:acaoOK];
    [alert addAction:acaoCancelar];
    [alert addAction:acaoExcluir];
    
    [self presentViewController:alert animated:YES completion:nil];
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
