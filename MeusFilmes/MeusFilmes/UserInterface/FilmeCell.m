//
//  FilmeCell.m
//  MeusFilmes
//
//  Created by Cast Group on 11/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "FilmeCell.h"

@implementation FilmeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.filmeImageView.layer.cornerRadius = self.filmeImageView.frame.size.width / 2;
    self.filmeImageView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
