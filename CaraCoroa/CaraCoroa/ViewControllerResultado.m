#import "ViewControllerResultado.h"

@interface ViewControllerResultado ()

@property (weak, nonatomic) IBOutlet UIImageView *imagemCoroa;
@property (weak, nonatomic) IBOutlet UIImageView *imagemCara;

@end

@implementation ViewControllerResultado

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imagemCara.hidden = YES;
    self.imagemCoroa.hidden = YES;
    
    if([self.valorResultado intValue] > 50) {
        self.imagemCara.hidden = NO;
    } else {
        self.imagemCoroa.hidden = NO;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)voltar:(UIButton*) sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
