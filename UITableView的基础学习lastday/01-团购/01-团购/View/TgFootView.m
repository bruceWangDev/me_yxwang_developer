//
//  TgFootView.m
//  01-团购
//
//  Created by brucewang on 2019/3/13.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "TgFootView.h"

@interface TgFootView ()

@property (weak, nonatomic) IBOutlet UIButton *loadBtn;

@property (weak, nonatomic) IBOutlet UIView *showView;

@end

@implementation TgFootView

+ (instancetype)footView {
    
    return [[[NSBundle mainBundle] loadNibNamed:@"TgFootView" owner:nil options:nil] lastObject];
    
}

/**
 点击了加载按钮
 */
- (IBAction)loadBtnClick {
    
    self.loadBtn.hidden = YES;
    self.showView.hidden = NO;
 
    /*
     加载数据
     
     1、加载更多的模型数据
     
     2、刷新表格(告诉 tableView 重新加载模型数据，调用 tableView 的 loadData 方法)
     */
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([self.delegate respondsToSelector:@selector(tgFootViewDidClickedLoadBtn:)]) {
            
            [self.delegate tgFootViewDidClickedLoadBtn:self];
            
        }
        
        self.loadBtn.hidden = NO;
        self.showView.hidden = YES;
        
        
    });
}

@end
