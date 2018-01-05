//
//  CarroCell.h
//  Carros Aula
//
//  Created by C1284047 (Edi Vergis) on 27/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncDownloadImageView.h"

@interface CarroCell : UITableViewCell

@property (nonatomic, assign) NSUInteger tipo;

@property (weak, nonatomic) IBOutlet AsyncDownloadImageView *imagemCarro;
@property (weak, nonatomic) IBOutlet UILabel *descricaoCarro;


@end
