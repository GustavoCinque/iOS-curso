//
//  ViewController.m
//  PrecoBitcoin
//
//  Created by Cast Group on 21/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *valorBitcoin;
@property (weak, nonatomic) IBOutlet UIButton *btnAtualizar;

@end

@implementation ViewController {
    UIViewController *viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)atualizarValorBitcoin:(id)sender {
    [self recuperaValorBitcoin];
}

-(void) recuperaValorBitcoin {
    
    [_btnAtualizar setTitle:@"Atualizando" forState:UIControlStateNormal];
    
    [self exibeLoadingViewController];
    
    NSURL *url = [NSURL URLWithString:@"https://blockchain.info/pt/ticker"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(!error) {
            
            NSError *erroJson = nil;
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&erroJson];
            if(!erroJson) {
                NSDictionary *brl = json[@"BRL"];
                NSString *preco = brl[@"buy"];
                NSString *symbol = brl[@"symbol"];
                
                NSNumberFormatter *format = [NSNumberFormatter new];
                format.numberStyle = NSNumberFormatterDecimalStyle;
                format.locale = [NSLocale localeWithLocaleIdentifier:@"pt_BR"];
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.valorBitcoin.text = [NSString stringWithFormat:@"%@ %@", symbol, [format stringFromNumber:@(preco.doubleValue)]];
                    [_btnAtualizar setTitle:@"Atualizar" forState:UIControlStateNormal];
                    
                });
                [self ocultaLoadingViewController];
            } else {
                NSLog(@"%@", error.description);
            }
        } else {
            NSLog(@"%@", error.description);
        }
    }] resume];
    
}

-(void) exibeLoadingViewController {
    viewController = [[UIStoryboard storyboardWithName:@"Utils" bundle:nil] instantiateViewControllerWithIdentifier:@"loading"];
    [self presentViewController:viewController animated:YES completion:nil];
}

-(void) ocultaLoadingViewController {
    if(viewController) {
        [viewController dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
