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

- (BOOL)prefersStatusBarHidden {
    
    return YES;
    
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // 设置行高
    self.tableV.rowHeight = 66; // 默认值是44 (每一行的高度一致)
    self.tableV.delegate = self;
    
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Hero * hero = self.heros[indexPath.row];
    
    // 选中
//    NSLog(@"选中了 %ld 行", indexPath.row);
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"数据展示" message:hero.name preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = hero.name;
    }];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"%@",alertVC.textFields.firstObject.text);
        hero.name = alertVC.textFields.firstObject.text;
//        [self.tableV reloadData]; // 全部刷新
        NSIndexPath * index = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
        [self.tableV reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    [alertVC addAction:action];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:cancel];
    [self presentViewController:alertVC animated:YES completion:nil];
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取消选中
//    NSLog(@"取消选中了 %ld 行", indexPath.row);

}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.heros.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // static 修饰局部变量：可以保证局部变量只分配一次存储空间(只初始化一次)
    static NSString * ID = @"hero";
    
    // 1.通过一个标识 优先去缓存池寻找可循环利用的 cell
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果缓存池找不到可循环利用的 cell —— 创建一个新的 cell ，给 cell 一个标识
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        NSLog(@"缓存池找不到 cell - %ld",indexPath.row);
    }
    
    // 3.给 cell 设置新的数据
    Hero * hero = self.heros[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.icon];

    return cell;
    
}

@end
