//
//  ViewController.m
//  01-汽车品牌
//
//  Created by brucewang on 2019/3/11.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"
#import "CarGroup.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableV;

@property (nonatomic, strong) NSArray * carGroups;

@end

@implementation ViewController

#pragma mark - 隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    
    return YES;
    
}

#pragma mar - 懒加载
- (NSArray *)carGroups {
    
    if (_carGroups == nil) {
        
        // 德系品牌
        CarGroup * cg1 = [[CarGroup alloc] init];
        cg1.title = @"得得得";
        cg1.desc  = @"111";
        cg1.cars  = @[@"宝马",@"奥迪",@"宝马",@"奥迪",@"宝马",@"奥迪",@"宝马",@"奥迪"];
        
        // 日韩品牌
        CarGroup * cg2 = [[CarGroup alloc] init];
        cg2.title = @"日日日";
        cg2.desc  = @"222";
        cg2.cars  = @[@"丰田",@"本田",@"现代",@"起亚"];
        
        // 欧系品牌
        CarGroup * cg3 = [[CarGroup alloc] init];
        cg3.title = @"欧欧鸥";
        cg3.desc  = @"333";
        cg3.cars  = @[@"兰博基尼"];
        
        _carGroups = @[cg1, cg2, cg3];
    }
    return _carGroups;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // 设置代理
    self.tableV.dataSource = self;
    
}

#pragma mark - 数据源方法

/**
 一共多少组数据
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"1");
    return self.carGroups.count;
    
}

/**
 第 section 组有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"2 - 第 %ld 组",section);
    CarGroup * cg = self.carGroups[section];
    return cg.cars.count;
}

/**
 每一行显示怎样的内容(UITableViewCell)
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"3 - %ld - %ld",indexPath.section, indexPath.row);
    
    CarGroup * cg = self.carGroups[indexPath.section];
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = cg.cars[indexPath.row];
    return cell;
    
}

/**
 第 section 组显示怎么的头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    CarGroup * cg = self.carGroups[section];
    return cg.title;
    
}

/**
 第 section 组显示怎样的尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    CarGroup * cg = self.carGroups[section];
    return cg.desc;
    
}

@end
