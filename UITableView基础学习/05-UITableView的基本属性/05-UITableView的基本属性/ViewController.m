//
//  ViewController.m
//  05-UITableView的基本属性
//
//  Created by brucewang on 2019/3/11.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableV;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // 设置分割线颜色
    self.tableV.separatorColor = [UIColor redColor];
    // 设置分割线样式
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // 表格的头部控件(直接显示在表格的最顶部)
    self.tableV.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    // 表格的尾部控件
    self.tableV.tableFooterView = [[UISwitch alloc] init];
    
}

#pragma mark - UITableV dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行数据",indexPath.row];
    return cell;
    
}

@end
