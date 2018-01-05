//
//  ListarCarrosController.m
//  Carros Aula
//
//  Created by C1284047 (Edi Vergis) on 27/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ListarCarrosController.h"
#import "CarroCell.h"
#import "Carro.h"
#import "CarrosService.h"
#import "ServiceUserDefaults.h"

@interface ListarCarrosController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray<Carro*>* listaCarros;

@end

@implementation ListarCarrosController

static NSString *cellIdentifier = @"cellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:self action:@selector(atualizar:) forControlEvents:UIControlEventValueChanged];
    
    self.tableView.refreshControl = refreshControl;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CarroCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
    [[self segmentControl] setSelectedSegmentIndex:[ServiceUserDefaults sharedInstance].ultimoTipoSelecionado];
    
    [self atualizar:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView delegate, datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listaCarros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CarroCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    Carro *carro = self.listaCarros[indexPath.row];
    
    cell.descricaoCarro.text = carro.desc;
    
    cell.imagemCarro.urlFoto = carro.url_foto;
    
    return cell;
}

#pragma mark - Actions
- (IBAction)atualizar:(UIBarButtonItem *)sender {

    [CarrosService getCarrosPorTipo:(EnumTipoCarro)[ServiceUserDefaults sharedInstance].ultimoTipoSelecionado cache:(sender == nil) callback:^(NSArray<Carro *> *listaCarros, NSError *error) {
    
        if (!error) {
            self.listaCarros = listaCarros;
            [self.tableView reloadData];
        }else{
            NSLog(@"Error %@", error.localizedDescription);
        }
    }];
}

- (IBAction)atualizarTipoCarro:(UISegmentedControl *)sender {
    [[ServiceUserDefaults sharedInstance] setUltimoTipoSelecionado:sender.selectedSegmentIndex];
    [self atualizar:nil];
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
