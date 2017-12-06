#import "ViewController.h"
#import "ViewControllerResultado.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueJogar"]){
        ViewControllerResultado *destino = segue.destinationViewController;
        destino.valorResultado = [NSNumber numberWithInteger: arc4random_uniform(100)];
    }
}


@end
