//
//  BasicTextField.m
//  Componentes
//
//  Created by Cast Group on 10/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

#import "BasicTextField.h"

@interface BasicTextField()

@property(nonatomic, assign) IBInspectable BOOL borda;

@property(nonatomic, strong) IBInspectable UIColor *corDaBorda;

@end

@implementation BasicTextField

- (void)drawRect:(CGRect)rect {
    if(self.borda) {
        CALayer *border = [CALayer layer];
        CGFloat larguraDeBorda = 5;
        
        border.borderColor = self.corDaBorda.CGColor;
        
        border.frame = CGRectMake(0, rect.size.height - larguraDeBorda, rect.size.width, rect.size.height);
        
        border.borderWidth = larguraDeBorda;
        
        [self.layer addSublayer:border];
        [self.layer setMasksToBounds:YES];
    }
}

@end
