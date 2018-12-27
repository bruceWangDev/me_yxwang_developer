//
//  TableCellNestCollectionVCell.m
//  UITableVNestCollectionV
//
//  Created by brucewang on 2018/12/27.
//  Copyright © 2018 brucewang. All rights reserved.
//

#import "TableCellNestCollectionVCell.h"
#import "Masonry.h"

#define COLLECTIONVCELLIDENTIFIER @"CollectionVCell"

@interface TableCellNestCollectionVCell () <UICollectionViewDataSource>

/**
 尝试 tableViewCell 嵌套 collectionV
 */
@property (nonatomic, weak) UICollectionView * collectionV;

@end

@implementation TableCellNestCollectionVCell

/*
 initWithCoder: 使用文件的加载对象调用(如使用 xib 或者 storyboard)
 initWithFrame: 使用代码的加载对象调用(使用纯代码创建)
 
 initWithCoder: 只要对象是文件解析来的，就会调用 initWithCoder
 awakeFromNib:  从xib或者storyboard加载完毕就会调用
 顺序是: initWithCoder --> awakeFromNib
 
 
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"initWithaDecoder");
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"initWithFrame");
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"initWithStyle");
//        [self creatAdaptionHieght];
        [self creatCollectionV];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awakeFormNib");
}

#pragma mark - 创建 UI
- (void)creatCollectionV {
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置滚动方向 默认垂直滚动 现在设置为水平滚动 Horizontal n.水平 Vertical n.垂直
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(100.0f, 100.0f);
    
    UICollectionView * collectionV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionV.dataSource = self;
    collectionV.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:collectionV];
    
    [collectionV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    // 注意: 我理解的 collectionV 是必须注册 cell 的
    [collectionV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:COLLECTIONVCELLIDENTIFIER];
    
}

#pragma mark - UICollectionV dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:COLLECTIONVCELLIDENTIFIER forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (void)creatAdaptionHieght {
    
    /*
     self.contentView addSubview 和 self addSubview 的区别:
     
     cmd 进 contentView ，苹果官方给出的提示:
     If you want to customize cells by simply adding additional views, you should add them to the content view so they will be positioned appropriately as the cell transitions into and out of editing mode.
     如果您想通过简单地添加其他视图来自定义单元格，那么您应该将它们添加到content视图中，以便在单元格转换到编辑模式和退出编辑模式时对它们进行适当的定位。
     
     我的理解:
     如果要让 cell 有编辑功能。如：左滑对cell进行删除，那么就要使用 self.contentView addSubview
     当我不使用 self.contentView ，直接使用 self 的时候再去左滑发现原来的 cell 子控件并没有向左移动
     
     [self.contentView addSubview:titleLabel];
     [self addSubview:titleLabel];
     */
    
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"科比·布莱恩特      科比·布莱恩特      科比·布莱恩特     科比·布莱恩特";
    titleLabel.numberOfLines = 0;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.backgroundColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right);
    }];
    
    UILabel * numberLabel = [[UILabel alloc] init];
    numberLabel.text = @"8·24          8·24          8·24          8·24          8·24          8·24          8·24          8·24";
    numberLabel.numberOfLines = 0;
    numberLabel.textColor = [UIColor blackColor];
    numberLabel.backgroundColor = [UIColor cyanColor];
    numberLabel.textAlignment = NSTextAlignmentLeft;
    numberLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:numberLabel];
    
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(titleLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    /*
     总结一下:
        多个 label 的自适应高度
        1、首先需要将 label 的 numberOfLines 设置为 0
        2、其次，第一个 label 不需要设置 bottom
        3、第二个 label.top 设置距离 第一个 label.bottom 就好
        4、一定要设置 第二个 label 距离底部约束
     */
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
