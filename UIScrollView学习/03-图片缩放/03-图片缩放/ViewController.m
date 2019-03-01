//
//  ViewController.m
//  03-图片缩放
//
//  Created by brucewang on 2019/2/26.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

/*
 代理 / 委托 ..
 
 */

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // 设置内容尺寸
    self.scrollView.contentSize = self.imageView.frame.size;
    
    // 设置
    self.scrollView.delegate = self;
    
    // 设置最大和最小的缩放比例
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.2;
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    NSLog(@"开始拖拽 ---- ");
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"---正在滚动--- %@",NSStringFromCGPoint(scrollView.contentOffset));
    
}

// 当用户使用捏合手势的时候会调用
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    NSLog(@"---zoom");
    return self.imageView; // 返回需要进行缩放的控件
    
}

@end
