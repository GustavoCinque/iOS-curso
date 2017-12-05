#import "ViewController.h"
#import "ViewControllerDois.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *campoTextoParametro;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if([identifier isEqualToString:@"segueSegundaTela"]) {
        if([self.campoTextoParametro.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length > 0) {
            [self performSegueWithIdentifier:identifier sender:sender];
        }
    }
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"segueSegundaTela"]) {
        NSString *parametro = self.campoTextoParametro.text;
        ViewControllerDois *destino = segue.destinationViewController;
        destino.campoTexto = parametro;
    }
}

@end
