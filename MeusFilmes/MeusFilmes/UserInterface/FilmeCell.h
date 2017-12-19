//
//  FilmeCell.h
//  MeusFilmes
//
//  Created by Cast Group on 11/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilmeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *filmeImageView;
@property (weak, nonatomic) IBOutlet UILabel *descricao;
@property (weak, nonatomic) IBOutlet UILabel *nome;

@end
