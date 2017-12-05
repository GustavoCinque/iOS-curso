#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *views;

@property (weak, nonatomic) IBOutlet UILabel *labelAtividade;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (UIView *view in self.views) {
        view.hidden = YES;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)alternarEstadoDasViews:(id)sender {
    [self toogleView];
}

- (IBAction)selecionarAtividade:(UIButton *)sender {
    [self toogleView];
    self.labelAtividade.text = [sender titleForState:UIControlStateNormal];
}

-(void) toogleView {
    [UIView animateWithDuration: 0.3 animations:^{
        for (UIView *view in self.views) {
            view.hidden = !view.hidden;
        }
    }];
}

@end
