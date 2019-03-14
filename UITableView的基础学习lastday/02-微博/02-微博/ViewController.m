//
//  ViewController.m
//  02-微博
//
//  Created by brucewang on 2019/3/13.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"
#import "Statues.h"
#import "StatuesCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray * statues;

@end

@implementation ViewController

#pragma mark - 懒加载
- (NSArray *)statues {
    
    if (_statues == nil) {
     
        NSString * path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray * statuesArray = [[NSMutableArray alloc] init];
        for (NSDictionary * dict in dictArray) {
            
            // 模型
            Statues * s = [Statues statuesWithDict:dict];
            [statuesArray addObject:s];
        }
        _statues = statuesArray;
    }
    return _statues;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.rowHeight = 300;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.statues.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * ID = @"statuesID";
    StatuesCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[StatuesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    Statues * statues = self.statues[indexPath.row];
    cell.statues = statues;
    return cell;
}

@end
