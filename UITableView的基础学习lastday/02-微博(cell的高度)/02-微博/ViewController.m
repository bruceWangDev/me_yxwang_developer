//
//  ViewController.m
//  02-微博
//
//  Created by brucewang on 2019/3/13.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"
#import "Statues.h"
#import "StatuesFrame.h"
#import "StatuesCell.h"

@interface ViewController ()

/**
 存放所有 frame 的模型数据
 */
@property (nonatomic, strong) NSArray * statuesFrames;

@end

@implementation ViewController

#pragma mark - 懒加载
- (NSArray *)statuesFrames {
    
    if (_statuesFrames == nil) {
     
        NSString * path  = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray * statuesFrameArray = [[NSMutableArray alloc] init];
        for (NSDictionary * dict in dictArray) {
            
            Statues * statues = [Statues statuesWithDict:dict];
            StatuesFrame * statuesFrame = [[StatuesFrame alloc] init];
            statuesFrame.statues = statues;
            [statuesFrameArray addObject:statuesFrame];
        }
        _statuesFrames = statuesFrameArray;
    }
    return _statuesFrames;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.statuesFrames.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.创建 cell
    StatuesCell * cell = [StatuesCell cellWithTableView:tableView];
    
    // 2.在这个方法中算好了 cell 的高度
    cell.statuesFrame = self.statuesFrames[indexPath.row];
    
    // 3.返回 cell
    return cell;
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StatuesFrame * statuesFrame = self.statuesFrames[indexPath.row];
    return statuesFrame.cellHeight;
}

@end
