//
//  ZBJCell.m
//  ZBJapp
//
//  Created by 范茂羽 on 16/3/24.
//  Copyright © 2016年 范茂羽. All rights reserved.
//

#import "ZBJCell.h"

@implementation ZBJCell

-(void)configUI:(PrjModel*)model
{
    self.nameLabel.text = model.title;
    self.introduceLabel.text = model.introduce;
    self.priceLabel.text = model.price;
}

+(CGFloat)heightForCell:(PrjModel*)model
{
    return 44 + [model.introduce boundingRectWithSize:CGSizeMake(375-20-60, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]} context:nil].size.height;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
