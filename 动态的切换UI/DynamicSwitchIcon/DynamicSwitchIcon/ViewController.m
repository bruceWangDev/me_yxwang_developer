//
//  ViewController.m
//  DynamicSwitchIcon
//
//  Created by brucewang on 2018/12/29.
//  Copyright © 2018 brucewang. All rights reserved.
//

#import "ViewController.h"
#import "SwitchIconTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self loadIcon];
    
}

#pragma mark - load Icon
- (void)loadIcon {
    
    /*
     在 iOS 10.3 苹果添加了动态更换图标的功能，通过这个功能，我们可以在适当的时候通过特定的方式为我们的 app 更换图标。
     听起来似很好很方便，实则没有。
     原因如下:
     (1) 更换的图标，我们需要预置在项目中
     (2) 替换图标这个功能，一定要经过用户的同意(虽然有跳过这一步的方法，但是不建议使用)
     
     虽然我们在使用这个功能时候有种种限制，但是瑕不掩瑜，它同样为我们的用户体验带来了提升:
     (1) 逢年过节想换个应景的 app 图标，不用在发版本了
     (2) 公司有个重大活动需要更换图标，不用担心活动前不能成本的发版本上线了
     
     注意: 更换的不只是 app 的图标，还有通知栏中的图标，以及设置界面中的图标以及所有和我们 app 相关的图标
     
     */
    
    NSLog(@"当前的图标名称是 is %@",[SwitchIconTool getCurrentAppIconName]);
    
    UIButton * button = [[UIButton alloc] init];
    
    
}


@end
