//
//  ViewController.m
//  AnotacoesMark1
//
//  Created by Cast Group on 12/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *anotacoes;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.anotacoes.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"anotacoes"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)acionarBotaoSalvar:(id)sender {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:self.anotacoes.text
                     forKey:@"anotacoes"];

    [userDefaults synchronize];
    
}

-	(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.anotacoes resignFirstResponder];
}


@end
