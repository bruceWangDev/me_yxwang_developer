//
//  HeadView.m
//  02-QQ好友列表
//
//  Created by brucewang on 2019/3/19.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "HeadView.h"
#import "FriendGroup.h"

@interface HeadView ()

@property (nonatomic, weak) UIButton * nameBtn;

@property (nonatomic, weak) UILabel * countL;

@end

@implementation HeadView

+ (HeadView *)headViewWithTableView:(UITableView *)tableView {
    
    static NSString * ID = @"header";
    HeadView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (view == nil) {
        view = [[HeadView alloc] initWithReuseIdentifier:ID];
    }
    return view;
}

/**
 在初始化方法中，headView 的 frame 和 bounds 没有值 都是 0
 实际上 任何 UIView 调用 init 方法中的 frame bounds 都是 0
 所以一般不在 init 中设置子控件的 frame
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        // 创建子控件
        UIButton * nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [nameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [nameBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [nameBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];

        // 设置按钮内部的左边箭头图片
        [nameBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];

        // 设置按钮的左对齐
        nameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        // 设置按钮的内边距 - mj在这么早的时候就讲过了
        nameBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        nameBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
//        nameBtn.imageEdgeInsets
        
        // 设置按钮内部的 imageV 的内容模式为居中显示
        nameBtn.imageView.contentMode = UIViewContentModeCenter;
        // 超出边框的内容不需要裁剪
        nameBtn.imageView.clipsToBounds = NO;
        
        [nameBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:nameBtn];
        _nameBtn = nameBtn;
        
        UILabel * countL = [[UILabel alloc] init];
        countL.textColor = [UIColor grayColor];
        countL.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:countL];
        _countL = countL;
    }
    return self;
}

- (void)click {
    
    NSLog(@"%@",self.fg.name);
    // 1.修改组模型的标记
    self.fg.opend = !self.fg.isOpend;
    // 2.刷新表格
    if ([self.delegate respondsToSelector:@selector(headViewDidClickedName:)]) {
        [self.delegate headViewDidClickedName:self];
    }
    
}

/**
 当一个控件被添加到父控件中就会调用 .. 系统调用
 */
- (void)didMoveToSuperview {
    
    // 3.控制箭头的状态(旋转，用到 transfrom)
    if (self.fg.opend) {
        self.nameBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.nameBtn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    
}

/**
 一般在这里面布局内部的子控件(设置子控件的 frame)
 
 系统自动调用
 当一个控件 frame 发生改变的时候就会调用
 */
- (void)layoutSubviews {
    
    // layout subviews 布局 子控件 方法名就证明了在这个方法中摆正你的子控件，或者说在这个方法中设置子控件的布局
#warning 一定要重写父类的方法
    [super layoutSubviews];
    
    // 1.设置按钮的 frame
    _nameBtn.frame = self.bounds;
    
    // 2.设置好友数的 frame
    CGFloat countW = 120;
    CGFloat countH = self.frame.size.height;
    CGFloat countX = self.frame.size.width - 10 - countW;
    CGFloat countY = 0;
    _countL.frame = CGRectMake(countX, countY, countW, countH);

}

- (void)setFg:(FriendGroup *)fg {
    
    _fg = fg;
    
    // 1.设置按钮名称
    [self.nameBtn setTitle:fg.name forState:UIControlStateNormal];
    
    // 2.设置好友数
    self.countL.text = [NSString stringWithFormat:@"%d/%ld", fg.online, fg.friends.count];
    
}

@end
