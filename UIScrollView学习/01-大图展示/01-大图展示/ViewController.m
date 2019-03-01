//
//  ViewController.m
//  01-大图展示
//
//  Created by brucewang on 2019/2/26.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UIButton *scrollBtn;
- (IBAction)scroll;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // 设置 scrollView 内容的尺寸（滚动的范围）
//    self.scrollView.contentSize = self.imageV.frame.size;
    self.scrollView.contentSize = self.imageV.image.size; // 总体内容的范围（滚动视图）
    
    self.scrollView.contentInset = UIEdgeInsetsMake(10, 20, 40, 80);
//    self.scrollView.frame.size; // 可视范围
}

- (IBAction)scroll {
 
//    CGPoint offset = CGPointMake(-100, -100);
    CGPoint offset = self.scrollView.contentOffset;
    offset.x += 10;
    offset.y += 10;
    [self.scrollView setContentOffset:offset animated:YES];
    
}

@end
