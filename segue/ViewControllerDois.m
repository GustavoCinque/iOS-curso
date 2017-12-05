#import "ViewControllerDois.h"

@interface ViewControllerDois ()

@property (weak, nonatomic) IBOutlet UILabel *campoLabel;

@end

@implementation ViewControllerDois

- (void)viewDidLoad {
    [super viewDidLoad];
    self.campoLabel.text = self.campoTexto;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)voltar:(UIButton*) sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
