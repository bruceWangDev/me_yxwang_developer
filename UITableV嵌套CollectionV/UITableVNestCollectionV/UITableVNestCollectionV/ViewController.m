//
//  ViewController.m
//  UITableVNestCollectionV
//
//  Created by brucewang on 2018/12/25.
//  Copyright © 2018 brucewang. All rights reserved.
//

#import "ViewController.h"
#import "TableCellNestCollectionVCell.h"

#define CELLIFENTIFIER     @"Cell"
#define NESTCELLIFENTIFIER @"NestCell"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView * tableV;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // 先创建一个 tableV 然后在最后一个 cell 中添加一个 collectionV
    [self creatUI];
    
}

#pragma mark - 创建 UI
- (void)creatUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"嵌套使用";
    
    UITableView * tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    tableV.dataSource = self;
    tableV.delegate = self;
    
    tableV.estimatedRowHeight = 60.0f;
//    tableV.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:tableV];
    
    [tableV registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLIFENTIFIER];
    [tableV registerClass:[TableCellNestCollectionVCell class] forCellReuseIdentifier:NESTCELLIFENTIFIER];
}

#pragma mark - tableV dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 16;
    } else {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELLIFENTIFIER forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.text = @"UITableV cell";
        return cell;
    } else {
        TableCellNestCollectionVCell * cell = [tableView dequeueReusableCellWithIdentifier:NESTCELLIFENTIFIER forIndexPath:indexPath];
        cell.backgroundColor = [UIColor orangeColor];
        return cell;
    }
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 60.0f;
    } else {
        return 120.0f;
    }
}

@end
