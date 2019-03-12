//
//  ViewController.m
//  08-汽车品牌
//
//  Created by brucewang on 2019/3/12.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"
#import "CarGroup.h"
#import "Car.h"

@interface ViewController () <UITableViewDataSource>

/**
 车品牌组数据
 */
@property (nonatomic, strong) NSArray * carGroups;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    
    
}

- (BOOL)prefersStatusBarHidden {
    
    return YES;
    
}

#pragma mark - 懒加载
- (NSArray *)carGroups {
    
    if (_carGroups == nil) {
        
        // 1.初始化路径
        NSString * path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        
        // 2.加载数组
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 3.将 dictArray 里面的所有字典转成模型对象，放在新的数组中
        NSMutableArray * cgArr = [[NSMutableArray alloc] init];
        for (NSDictionary * dict in dictArray) {
            
            // 3.1 创建模型对象
            CarGroup * cg = [CarGroup groupWithDict:dict];
            
            // 3.2 添加模型对象到数组中
            [cgArr addObject:cg];
        }
        // 4.赋值
        _carGroups = cgArr;
    }
    return _carGroups;
}

#pragma mark - UITableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.carGroups.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    CarGroup * cg = self.carGroups[section];
    return cg.cars.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 标识
    static NSString * ID = @"car";
    
    // 从缓存池中寻找可循环利用的 cell
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 如果找不到的话，就创建 cell 并且给它一个标识
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 取出模型 给 cell 赋值
    CarGroup * cg = self.carGroups[indexPath.section];
    Car * car = cg.cars[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text  = car.name;
    
    return cell;
    
}

// 第 section 组显示的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    CarGroup * cg = self.carGroups[section];
    return cg.title;
    
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    // valueForKeyPath: 这方法牛逼阿
    return [self.carGroups valueForKeyPath:@"title"];
    
}

@end
