//
//  ZBJCell.h
//  ZBJapp
//
//  Created by 范茂羽 on 16/3/24.
//  Copyright © 2016年 范茂羽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrjModel.h"

@interface ZBJCell : UITableViewCell

-(void)configUI:(PrjModel*)model;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

+(CGFloat)heightForCell:(PrjModel*)model;

@end
