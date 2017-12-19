#import <UIKit/UIKit.h>

@interface TableCellEstado : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *nome;
@property(nonatomic, weak) IBOutlet UILabel *capital;
@property(nonatomic, weak) IBOutlet UILabel *regiao;
@property(nonatomic, weak) IBOutlet UIImageView *bandeira;

@end
