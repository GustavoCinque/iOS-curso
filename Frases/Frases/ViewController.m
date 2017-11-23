//
//  ViewController.m
//  Frases
//
//  Created by Cast Group on 23/11/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"
#import "CGMensagem.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelFrase;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)novaFrase:(id)sender {
    NSMutableArray *array = [self recuperaListaMensagem];
    NSNumber *integer = [NSNumber numberWithInteger: arc4random_uniform((uint32_t)array.count-1)];
    CGMensagem *mensagem = [array objectAtIndex:[integer intValue]];
    self.labelFrase.text = mensagem.mensagem;
    
}

-(NSArray<CGMensagem*>*) recuperaListaMensagem {
    NSMutableArray *array = [@[[[CGMensagem alloc] initComMensagem:@"Se você traçar metas absurdamente altas e falhar, seu fracasso será muito melhor que o sucesso de todos."], [[CGMensagem alloc] initComMensagem:@"O sucesso normalmente vem para quem está ocupado demais para procurar por ele."], [[CGMensagem alloc] initComMensagem:@"A vida é melhor para aqueles que fazem o possível para ter o melhor."], [[CGMensagem alloc] initComMensagem:@"Os empreendedores falham, em média, 3,8 vezes antes do sucesso final. O que separa os bem-sucedidos dos outros é a persistência."], [[CGMensagem alloc] initComMensagem:@"Se você não está disposto a arriscar, esteja disposto a uma vida comum."], [[CGMensagem alloc] initComMensagem:@"Escolha uma ideia. Faça dessa ideia a sua vida. Pense nela, sonhe com ela, viva pensando nela. Deixe cérebro, músculos, nervos, todas as partes do seu corpo serem preenchidas com essa ideia. Esse é o caminho para o sucesso"]] mutableCopy];
    return array;
}

@end
