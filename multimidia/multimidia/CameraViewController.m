//
//  CameraViewController.m
//  multimidia
//
//  Created by Cast Group on 08/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController() <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imagemFoto;
@property (nonatomic, strong) UIImagePickerController *imagePicker;

@end

@implementation CameraViewController

-(void)viewDidLoad {
    
    self.imagePicker = [UIImagePickerController new];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = YES;
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"Camera não disponivel");
    }
    
    
    
}
- (IBAction)selecionarFoto:(id)sender {
    
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
    
}
- (IBAction)capturarFoto:(id)sender {
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

-(void)didReceiveMemoryWarning {
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    self.imagemFoto = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
