//
//  ViewController.m
//  ComparadorCombustivel
//
//  Created by Cast Group on 23/11/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UITextField *_textFieldSelecionado;
}

@property (weak, nonatomic) IBOutlet UITextField *precoGasolina;
@property (weak, nonatomic) IBOutlet UITextField *precoAlcool;
@property (weak, nonatomic) IBOutlet UILabel *labelResultado;

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

- (IBAction)calcular:(id)sender {
    
    NSString *valorAlcool = [self.precoAlcool.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    
    NSString *valorGasolina = [self.precoGasolina.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    
    CGFloat precoAlcool = valorAlcool.floatValue;
    CGFloat precoGasolina = valorGasolina.floatValue;
    
    CGFloat resultado = precoAlcool/precoGasolina;
    
    if(resultado >= 0.7) {
        self.labelResultado.text = @"Melhor utilizar Gasolina";
    } else {
        self.labelResultado.text = @"Melhor utilizar Alcool";
    }
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    _textFieldSelecionado = textField;
    return YES;
}

-	(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_textFieldSelecionado resignFirstResponder];
}

@end
