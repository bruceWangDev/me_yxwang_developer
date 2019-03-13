//
//  ViewController.m
//  01-团购
//
//  Created by brucewang on 2019/3/13.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"
#import "Tg.h"
#import "TgCell.h"
#import "TgFootView.h"

@interface ViewController () <UITableViewDataSource, TgFootViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableV;

@property (nonatomic, strong) NSMutableArray * tgs;

@end

@implementation ViewController

#pragma mark - 懒加载
- (NSMutableArray *)tgs {
    
    if (_tgs == nil) {
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray * tgsArray = [[NSMutableArray alloc] init];
        for (NSDictionary * dict in dictArray) {
            Tg * tg = [Tg tgWithDict:dict];
            [tgsArray addObject:tg];
        }
        _tgs = tgsArray;
    }
    return _tgs;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.tableV.rowHeight = 80.0f;
 
    // 整个 tableV footV(footV 的宽度永远是 tableV 的高度) footV 只需要设置高度 x y 永远为 0
//    self.tableV.tableFooterView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    TgFootView * footV = [TgFootView footView];
    footV.delegate = self;
    self.tableV.tableFooterView = footV;
    
}

#pragma mark - tg foot delegate
- (void)tgFootViewDidClickedLoadBtn:(TgFootView *)tgFootView {
    
    [self loadMoreData];
    
}

- (void)loadMoreData {
    
    // 1、加载更多的模型数据
    Tg * tg = [[Tg alloc] init];
    tg.icon = @"";
    tg.title = @"new add";
    tg.price = @"9999";
    tg.buyCount = @"0";
    [self.tgs addObject:tg];
    
    // 2、刷新表格(告诉 tableView 重新加载模型数据，调用 tableView 的 loadData 方法)
    [self.tableV reloadData];
    
}

#pragma mark - 数据源数组
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tgs.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TgCell * cell = [TgCell cellWithTableView:tableView];
    
    // 取出模型
    Tg * tg = self.tgs[indexPath.row];
    cell.tg = tg;
    
    return cell;
    
}

@end
