//
//  ViewController.m
//  02-喜马拉雅
//
//  Created by brucewang on 2019/2/26.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *lastBtn;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
//    CGFloat contentH = self.lastBtn.frame.origin.y + self.lastBtn.frame.size.height + 10;
    CGFloat contentH = CGRectGetMaxY(self.lastBtn.frame) + 10;
    self.scrollView.contentSize = CGSizeMake(0, contentH);
    
    // 增加额外的滚动区域
    self.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 44, 0);
    
    // 设置一开始的滚动位置
    self.scrollView.contentOffset = CGPointMake(0, -64);
    
}


@end
