//
//  ProfileView.m
//  Componentes
//
//  Created by Cast Group on 10/01/18.
//  Copyright © 2018 castgroup. All rights reserved.
//

#import "ProfileView.h"

@interface ProfileView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *badgerLabel;

@end

@implementation ProfileView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self loadViewFromNib];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadViewFromNib];
    }
    return self;
}

- (void) loadViewFromNib {
    UIView *view = [[[NSBundle bundleForClass:self.class ] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil] firstObject];
    
    view.frame = self.bounds;
    [self addSubview:view];
    self.badgerValue = 0;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
        
    self.badgerLabel.text = [@(self.badgerValue) stringValue];
    self.badgerLabel.layer.cornerRadius = self.badgerLabel.frame.size.height/2;
    [self.badgerLabel.layer setMasksToBounds:YES];
    
    self.imageView.image = self.imageProfile;
    self.imageView.layer.cornerRadius = self.imageView.frame.size.height/2;
    self.imageView.layer.borderColor = [UIColor blackColor].CGColor;
    [self.imageView.layer setMasksToBounds:YES];
    self.opaque = YES;
}


@end
