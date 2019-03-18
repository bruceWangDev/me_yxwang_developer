//
//  main.m
//  04-通知中心
//
//  Created by brucewang on 2019/3/18.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewCompany.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 初始化机构
        NewCompany * tx = [[NewCompany alloc] init];
        tx.name = @"腾讯新闻";
        
        NewCompany * sina = [[NewCompany alloc] init];
        sina.name = @"新浪新闻";
        
        // 初始化用户
        Person * zs = [[Person alloc] init];
        zs.name = @"张三";
        
        Person * ls = [[Person alloc] init];
        ls.name = @"李四";
        
        Person * ww = [[Person alloc] init];
        ww.name = @"王五";
        
        // 模拟发布新闻
        NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
        
        // 先监听 后发布
        [center addObserver:zs selector:@selector(newsCompany:) name:@"junshi_news" object:nil];
        
        // tx 发布一则通知
        [center postNotificationName:@"junshi_news"
                              object:tx
                            userInfo:@{@"title":@"NBA",
                                       @"intro":@"NBA_TEXT"}];
        
        // sina 发布一则通知
        [center postNotificationName:@"yule_news"
                              object:sina
                            userInfo:@{@"title":@"CBA",
                                       @"intro":@"CBA_TEXT"}];
    }
    return 0;
}
