//
//  ViewController.m
//  Animation
//
//  Created by Cast Group on 05/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

#import "ViewController.h"
#define degreesToRadians(x)(M_PI*x/180)

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *logo;

@property (weak, nonatomic) IBOutlet UIPickerView *comboAnimacoes;

@property (weak, nonatomic) IBOutlet UIButton *botaoAnimar;

@property(nonatomic, strong) NSArray* listaAnimacoes;

@property(nonatomic, assign) NSInteger xOriginal;

@end

@implementation ViewController

#pragma mark Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listaAnimacoes = [[NSArray alloc] initWithObjects:@"Alpha", @"Mover", @"Mover - Transform", @"Redimensionar", @"Redimensionar - Transform", @"Girar - Transformação", @"Animação com blocos 1", @"Animação com blocos 2", nil];
    
    self.xOriginal = self.logo.frame.origin.x;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)animar:(id)sender {
    NSInteger linha = [self.comboAnimacoes selectedRowInComponent:0];
    NSString *nomeAnimacao = self.listaAnimacoes[linha];
    if([nomeAnimacao isEqualToString:@"Alpha"]) {
        [self animarAlpha];
    }
    if([nomeAnimacao isEqualToString:@"Mover"]) {
        [self animarMover];
    }
    if([nomeAnimacao isEqualToString:@"Mover - Transform"]) {
        [self animarMoverTransform];
    }
    if([nomeAnimacao isEqualToString:@"Redimensionar"]) {
        [self animarRedimensionar];
    }
    if([nomeAnimacao isEqualToString:@"Redimensionar - Transform"]) {
        [self animarRedimensionarTransform];
    }
    if([nomeAnimacao isEqualToString:@"Girar - Transformação"]) {
        [self animarGirarTransformacao];
    }
    if([nomeAnimacao isEqualToString:@"Animação com blocos 1"]) {
        [self animarAnimacaoComBlocosUm];
    }
    if([nomeAnimacao isEqualToString:@"Animação com blocos 2"]) {
        [self animarAnimacaoComBlocosDois];
    }
}

- (void) animarAlpha{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    
    if(self.logo.alpha == 1) {
        self.logo.alpha = 0;
    } else {
        self.logo.alpha = 1;
    }
    
    [UIView commitAnimations];
}

- (void) animarMover{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    
    CGRect rect = self.logo.frame;
    int x = rect.origin.x;
    int y = rect.origin.y;
    int width = rect.size.width;
    int height = rect.size.height;
    
    if(x == _xOriginal) {
        self.logo.frame = CGRectMake(x+100, y, width, height);
    } else {
        self.logo.frame = CGRectMake(x-100, y, width, height);
    }
    
    [UIView commitAnimations];
}

-(void) animarMoverTransform {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    
    int tx = _logo.transform.tx;
    
    if(tx == 0) {
        _logo.transform = CGAffineTransformMakeTranslation(100, 0);
    } else {
        _logo.transform = CGAffineTransformIdentity;
    }
    
    [UIView commitAnimations];
}

-(void) animarRedimensionar {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    
    if(_logo.bounds.size.width == 100){
        _logo.bounds = CGRectMake(_logo.bounds.origin.x, _logo.bounds.origin.y, 50, 61);
    } else {
        _logo.bounds = CGRectMake(_logo.bounds.origin.x, _logo.bounds.origin.y, 100, 122);
    }
    
    [UIView commitAnimations];
}

-(void) animarRedimensionarTransform {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    
    int ty = _logo.transform.a;
    
    if(ty == 1) {
        _logo.transform = CGAffineTransformMakeScale(2, 2);
    } else {
        _logo.transform = CGAffineTransformMakeScale(1, 1);
    }
    
    
    [UIView commitAnimations];
}

-(void) animarGirarTransformacao {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    
    //Deslocamento atual do eixo y da matrix
    int ty = _logo.transform.d;
    if(ty == 1) {
        _logo.transform = CGAffineTransformMakeRotation(degreesToRadians((180)));
    } else {
        _logo.transform = CGAffineTransformIdentity;
    }
    
    [UIView commitAnimations];
}

-(void) animarAnimacaoComBlocosUm {
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationCurveEaseOut animations:^{
        int tx = _logo.transform.tx;
        if(tx==0) {
            _logo.transform = CGAffineTransformMakeTranslation(100, 0);
        } else {
            _logo.transform = CGAffineTransformIdentity;
        }
    } completion:nil];
}

-(void) animarAnimacaoComBlocosDois {
    
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationCurveEaseOut animations:^{
            int ty = _logo.transform.d;
            if(ty == 1) {
                _logo.transform = CGAffineTransformMakeRotation(degreesToRadians((180)));
            } else {
                _logo.transform = CGAffineTransformIdentity;
            }
        } completion:^(BOOL finished){
            [UIView animateWithDuration:1.0 animations:^{
                if(_logo.alpha == 1) {
                    _logo.alpha = 0;
                } else {
                    _logo.alpha  = 1;
                }
            }];
        }];
}
#pragma mark - PickerView delegate e datasource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.listaAnimacoes.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.listaAnimacoes[row];
}
@end
