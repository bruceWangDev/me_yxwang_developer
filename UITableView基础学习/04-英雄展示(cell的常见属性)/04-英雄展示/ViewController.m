//
//  ViewController.m
//  04-英雄展示
//
//  Created by brucewang on 2019/3/11.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableV;

@property (nonatomic, strong) NSArray * heros;

@end

@implementation ViewController

#pragma mark - 懒加载
- (NSArray *)heros {
    
    if (_heros == nil) {
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        NSArray  * dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray * heroArray = [NSMutableArray array];
        for (NSDictionary * dic in dictArray) {
            
            Hero * hero = [Hero heroWithDict:dic];
            [heroArray addObject:hero];
        }
        _heros = heroArray;
    }
    return _heros;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // 设置行高
//    self.tableV.rowHeight = 66; // 默认值是44 (每一行的高度一致)
    self.tableV.delegate = self;
    
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60; // 每一行的高度不一致
    
}

#pragma mark - 数据源方法
// 不实现这个方法，默认就是1组
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 1;
//
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.heros.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // 取出模型
    Hero * hero = self.heros[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    
    // 设置 cell 右边指示器的类型
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
//    cell.accessoryView = [[UISwitch alloc] init];
    
    
    
    return cell;
    
}

@end
