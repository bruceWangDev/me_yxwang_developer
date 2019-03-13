//
//  TgCell.m
//  01-团购
//
//  Created by brucewang on 2019/3/13.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "TgCell.h"
#import "Tg.h"

@interface TgCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconV;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *priceL;
@property (weak, nonatomic) IBOutlet UILabel *buyCountL;

@end

@implementation TgCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {

    static NSString * ID = @"tgsCell";
    TgCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从 xib 中加载 cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TgCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setTg:(Tg *)tg {
    
    _tg = tg;
    
    self.iconV.image = [UIImage imageNamed:tg.icon];
    self.titleL.text = tg.title;
    self.priceL.text = [NSString stringWithFormat:@"￥%@",tg.price];
    self.buyCountL.text = [NSString stringWithFormat:@"%@人已购买",tg.buyCount];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
