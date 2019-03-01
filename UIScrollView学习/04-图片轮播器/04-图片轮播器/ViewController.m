//
//  ViewController.m
//  04-图片轮播器
//
//  Created by brucewang on 2019/2/27.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"

#define IMAGECOUNT 5

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // 一些固定的的尺寸参数
//    int imageCount = 5;
    CGFloat imageV_W = self.scrollView.frame.size.width;
    CGFloat imageV_H = self.scrollView.frame.size.height;
    CGFloat imageV_Y = 0;

    // 1、添加5张图片到 scrollView
    for (int i = 0; i < IMAGECOUNT; i++) {
        
        // 设置 frame
        CGFloat imageV_X = i * imageV_W;
        
        UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(imageV_X, imageV_Y, imageV_W, imageV_H)];
        
        // 设置图片
        NSString * imageName = [NSString stringWithFormat:@"img_0%d",i + 1];
        imageV.image = [UIImage imageNamed:imageName];
        
        [self.scrollView addSubview:imageV];
    }
    
    // 2、设置内容尺寸
    self.scrollView.contentSize = CGSizeMake(IMAGECOUNT * imageV_W, 0);
    
    // 3、隐藏水平滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    // 4、分页
    self.scrollView.pagingEnabled = YES;
    
    // 5、设置 pageControl 的总页数
    self.pageControl.numberOfPages = IMAGECOUNT;
    
    /*
     频率比较低的情况下 使用 CADisplayLink 0.01秒
     频率不低的情况下   使用 NSTimer       几秒
     */
    
    // 6.添加一个定时器
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
}

- (void)nextImage {
    
    // 1.增加 pageControl 的页码
    if (self.pageControl.currentPage == IMAGECOUNT - 1) {
        self.pageControl.currentPage = 0;
    } else {
        self.pageControl.currentPage++;
    }
    
    // 2.计算 scrollView 滚动的位置
    CGFloat offsetX = self.pageControl.currentPage * self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

#pragma mark - UIScrollView Delegate
// scrollView 正在滚动就会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"----");
    // 根据 scrollView 的滚动位置决定 pageControl contentOffset 用来表示滚动的位置
    CGFloat scrollV_W = scrollView.frame.size.width;
    int page = (scrollView.contentOffset.x + scrollV_W * 0.5) / scrollV_W;
    NSLog(@"page is %d",page);
    self.pageControl.currentPage = page;
    
  
}



@end
