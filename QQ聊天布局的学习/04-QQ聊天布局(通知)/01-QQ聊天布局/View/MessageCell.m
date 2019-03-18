//
//  MessageCell.m
//  01-QQ聊天布局
//
//  Created by brucewang on 2019/3/18.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "MessageCell.h"
#import "Message.h"
#import "MessageFrame.h"
#import "UIImage+Resize.h"

@interface MessageCell ()

/**
 时间
 */
@property (nonatomic, weak) UILabel * timeL;

/**
 头像
 */
@property (nonatomic, weak) UIImageView * iconV;

/**
 正文
 */
@property (nonatomic, weak) UIButton * textV;

@end

@implementation MessageCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString * ID = @"messagecell";
    MessageCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
            
        // 子控件的创建和初始化
        
        // 1.时间
        UILabel * timeL = [[UILabel alloc] init];
        timeL.font = TIMEFONT;
        timeL.textAlignment = NSTextAlignmentCenter;
        timeL.textColor = [UIColor grayColor];
        [self.contentView addSubview:timeL];
        self.timeL = timeL;
        
        // 2.头像
        UIImageView * iconV = [[UIImageView alloc] init];
        [self.contentView addSubview:iconV];
        self.iconV = iconV;
        
        // 3.正文
        UIButton * textV = [[UIButton alloc] init];
        textV.titleLabel.font = TEXTFONT;
        [textV setTitleColor:[UIColor blackColor] forState:UIControlStateNormal]; // 按钮的文字是分状态的
        textV.titleLabel.numberOfLines = 0;
        textV.contentEdgeInsets = UIEdgeInsetsMake(TEXTPADDING, TEXTPADDING, TEXTPADDING, TEXTPADDING);
        [self.contentView addSubview:textV];
        self.textV = textV;
        
        // 4.设置 cell 的背景色
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

- (void)setMsgFrame:(MessageFrame *)msgFrame {
    
    _msgFrame = msgFrame;
    
    Message * msg = msgFrame.msg;
    
    // 1.时间
    self.timeL.text = msg.time;
    self.timeL.frame = msgFrame.timeFrame;

    // 2.头像
    NSString * icon = (msg.type == MessageTypeMe) ? @"me" : @"other";
    self.iconV.image = [UIImage imageNamed:icon];
    self.iconV.frame = msgFrame.iconFrame;
    
    // 3.正文
    [self.textV setTitle:msg.text forState:UIControlStateNormal];
    self.textV.frame = msgFrame.textFrame;
    
    // 4.正文的背景
    if (msg.type == MessageTypeMe) { // 自己发的，蓝色
        
        [self.textV setBackgroundImage:[UIImage resizableImage:@"chat_send_nor"] forState:UIControlStateNormal];
        
    } else { // 别人发的，白色
        
        [self.textV setBackgroundImage:[UIImage resizableImage:@"chat_recive_nor"] forState:UIControlStateNormal];
        
    }
}

// 分类：给已经存在的类扩展一些方法

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
