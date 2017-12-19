#import "DetalheFilmeController.h"

@interface DetalheFilmeController ()
@property (weak, nonatomic) IBOutlet UIImageView *imagemDetalhe;
@property (weak, nonatomic) IBOutlet UILabel *tituloFilme;
@property (weak, nonatomic) IBOutlet UILabel *descricaoFilme;

@end

@implementation DetalheFilmeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tituloFilme.text = self.filme.nome;
    self.descricaoFilme.text = self.filme.descricao;
    self.imagemDetalhe.image = [UIImage imageNamed:self.filme.imagem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
